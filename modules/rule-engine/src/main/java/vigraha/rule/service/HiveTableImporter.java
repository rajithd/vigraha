package vigraha.rule.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.rule.repository.metadata.DataBaseMetaDataService;
import vigraha.rule.repository.metadata.model.Column;
import vigraha.rule.repository.metadata.model.DynamicStreamResultSet;
import vigraha.rule.repository.metadata.model.Limit;
import vigraha.rule.repository.metadata.model.SqlGenerator;
import vigraha.rule.util.StringUtils;

import javax.sql.DataSource;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class HiveTableImporter {

    private static final Logger logger = LoggerFactory.getLogger(HiveTableImporter.class);

    private static final String SPACE = " ";
    private static final String EQUALS = " = ";
    private static final String SINGLE_QUOTE = "'";
    private static final String REGEXP = " REGEXP ";
    private static final HashSet<String> NULL_LOGIC_VALUES;
    private static final int DEFAULT_BATCH_SIZE = 1000;

    static {
        NULL_LOGIC_VALUES = new HashSet<String>();
        for (SqlGenerator.NULL_LOGIC logic : SqlGenerator.NULL_LOGIC.values()) {
            NULL_LOGIC_VALUES.add(logic.toString());
        }
    }

    public long importTable(DataBaseMetaDataService databaseMetaDataService, String tableName,
                            Connection hiveConnection, DataSource dataSource) throws SQLException, IOException {

        List<Column> columns = dropAndCreateHiveTable(databaseMetaDataService, hiveConnection, tableName);

        List<String> subsColumns = new ArrayList<String>(columns.size());
        int i = 0;
        for (; i < columns.size(); i++) {
            Column column = columns.get(i);
            subsColumns.add(column.getName());
        }

        DynamicStreamResultSet dynamicStreamResultSet = null;

        try {
            dynamicStreamResultSet = getAllRecords(tableName, subsColumns, new HashMap<String, String>(), dataSource, null, true);
            return loadDataIntoHive(tableName, hiveConnection, columns, subsColumns, dynamicStreamResultSet);
        } finally {
            if (dynamicStreamResultSet != null) {
                dynamicStreamResultSet.closeAll();
            }
        }

    }

    private long loadDataIntoHive(String tableName, Connection hiveConnection, List<Column> columns, List<String> subsColumns, DynamicStreamResultSet dynamicStreamResultSet) throws SQLException, IOException {
        ResultSet records = dynamicStreamResultSet.getResultSet();
        final FileWriteInfo fileWriteState = createCsvTempFile(columns, subsColumns, records, tableName,  "table.csv");
        if(fileWriteState.getNumberOfRecord() <= 0) {
            logger.info("No data for table [{}]. Skipping Hive import.", tableName);
            return 0;
        }
        File subsFile = fileWriteState.getFile();
        String insertSql = "load data local inpath '" + subsFile.getAbsolutePath() + "' into table " + tableName;
        logger.debug("Running load data: {} ", insertSql);
        Statement stmt2 = hiveConnection.createStatement();
        ResultSet res = stmt2.executeQuery(insertSql);
        res.close();
        stmt2.close();

        return fileWriteState.getNumberOfRecord();
    }

    private DynamicStreamResultSet getAllRecords(String table, List<String> columns, Map<String, String> values,
                                                 DataSource dataSource,
                                                 Limit limit) throws Exception {
        return getAllRecords(table, columns, values, dataSource, limit, false);
    }

    private DynamicStreamResultSet getAllRecords(String table,
                                                 List<String> columns,
                                                 Map<String, String> values,
                                                 DataSource dataSource,
                                                 Limit limit,
                                                 boolean withOption)  {
        StringBuilder query = new StringBuilder(createSelectSQLWithWhere(columns, values, table, SqlGenerator.LOGIC.AND));

        if (limit != null) {
            query.append(" ").append(limit.toString());
        }
        return new SqlGenerator().getDynamicResultSet(query.toString(), dataSource, withOption);
    }


    private String createSelectSQLWithWhere(List<String> columns, Map<String, String> searchValues, String table, SqlGenerator.LOGIC logic) {
        StringBuilder builder = new StringBuilder(createSQL(columns, table));
        if (searchValues.size() != 0) {
            builder.append(" where ");
            Iterator<Map.Entry<String, String>> iterator = searchValues.entrySet().iterator();
            int i = 0;
            while (iterator.hasNext()) {
                Map.Entry<String, String> entry = iterator.next();
                if (i++ != searchValues.size() - 1) {
                    builder.append(entry.getKey()).append(createParam(entry)).append(SPACE).append(logic).append(SPACE);
                } else {
                    builder.append(entry.getKey()).append(createParam(entry));
                }
            }
        }
        return builder.toString();
    }

    private static String createSQL(List<String> columns, String table) {
        StringBuilder builder = new StringBuilder("select ");
        builder.append(columns.toString().replaceAll("\\[|\\]", ""));
        builder.append(" from ").append(table);
        return builder.toString();
    }



    private List<Column> dropAndCreateHiveTable(DataBaseMetaDataService dataBaseMetaDataService, Connection hiveCon, String tableName) throws SQLException {
        List<Column> columns = dataBaseMetaDataService.getColumns(tableName);

        dropHiveTable(hiveCon, tableName);
        createHiveTable(hiveCon, tableName, columns);

        return columns;
    }

    private void dropHiveTable(Connection hiveCon, String tableName) throws SQLException {
        Statement dropStmt = hiveCon.createStatement();
        dropStmt.execute("drop table " + tableName);
        dropStmt.close();
    }

    private void createHiveTable(Connection hiveCon, String tableName, List<Column> columns) throws SQLException {
        StringBuilder hiveDDLBuilder = new StringBuilder("create table ");
        hiveDDLBuilder.append(tableName);
        hiveDDLBuilder.append(" (");
        int i = 0;
        for (; i < columns.size(); i++) {
            Column column = columns.get(i);
            hiveDDLBuilder.append(column.getName());
            hiveDDLBuilder.append(" ");
            hiveDDLBuilder.append(convertToHiveType(column));
            if (i < columns.size() - 1) {
                hiveDDLBuilder.append(",");
            }
        }
        hiveDDLBuilder.append(")");

        logger.info("Hive DDL: {}", hiveDDLBuilder.toString());

        Statement stmt = hiveCon.createStatement();
        ResultSet res = null;
        try {
            res = stmt.executeQuery(hiveDDLBuilder.toString());
            res.close();
        } catch (SQLException ignore) {

        }
        stmt.close();

    }

    private String convertToHiveType(Column column) {
        switch (column.getDataType()) {
            case 1:
                return "string";
            case 2:
                return "INT";    //INTEGER
            case 3:
                return "number";
            case 4:
                return "INT"; //INT
            case -5:
                return "BIGINT";//BIGINT
            case -7:
                return "BOOLEAN"; //boolean
            case 8:
                return "DOUBLE";
            case 12:
                return "string";
            case 91:
                return "string"; //DATE
            case 93:
                return "string"; //DATE_TIME
            default:
                return "string";
        }

    }

    class FileWriteInfo {
        private File file;
        private long numberOfRecord;

        FileWriteInfo(File file, long numberOfRecord) {
            this.file = file;
            this.numberOfRecord = numberOfRecord;
        }

        public File getFile() {
            return file;
        }

        public long getNumberOfRecord() {
            return numberOfRecord;
        }
    }

    private FileWriteInfo createCsvTempFile(List<Column> columns, List<String> subsColumns, ResultSet rs,
                                            String subDir, String fileName) throws SQLException, IOException {
        File dir = new File(System.getProperty("java.io.tmpdir") + File.separatorChar
                +System.getProperty("user.name")+"-rwd"+ File.separatorChar+ subDir);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        File file = new File(dir, fileName);
        if (file.exists()) {
            file.delete();
        }

        FileWriter fileWriter = new FileWriter(file);
        long recordCount = 0;
        try {
            while (rs.next()) {
                recordCount++;

                writeCtrlARecords(rs, columns, fileWriter);
                fileWriter.write("\n");
            }
        } finally {
            if (fileWriter != null) {
                fileWriter.close();
            }
        }

        return new FileWriteInfo(file, recordCount);
    }

    private void writeCtrlARecords(ResultSet rs, List<Column> columns, OutputStreamWriter writer)
            throws SQLException, IOException {

        int j = 0;
        for (; j < columns.size(); j++) {
            Column column = columns.get(j);
            String val = convertToHiveValue(rs, column);
            writer.write(val);
            if (j < columns.size() - 1) {
                writer.write("\01");
            }
        }
    }

    private String convertToHiveValue(ResultSet rs, Column column) throws SQLException {
        switch (column.getDataType()) {
            case 1:
                return rs.getString(column.getName());
            case 2:
                return String.valueOf(rs.getInt(column.getName()));    //INTEGER
            case 3:
                return String.valueOf(rs.getInt(column.getName()));
            case 4:
                return String.valueOf(rs.getInt(column.getName())); //INT
            case -5:
                return String.valueOf(rs.getLong(column.getName())); //BIGINT
            case -7:
                return String.valueOf(rs.getBoolean(column.getName())); //boolean
            case 8:
                return String.valueOf(rs.getDouble(column.getName()));
            case 12:
                return String.valueOf(rs.getString(column.getName()));
            case 91:
                return StringUtils.convertDateToHiveDateType(rs.getDate(column.getName())); //DATE
            case 93:
                return StringUtils.convertDateTimeToHiveDateType(rs.getDate(column.getName())); //DATE_TIME
            default:
                return StringUtils.EMPTY_STRING;
        }
    }

    private String createParam(Map.Entry<String, String> entry) {
        String out;
        if (NULL_LOGIC_VALUES.contains(entry.getValue())) {
            out = " " + entry.getValue();
        } else {
            if (entry.getKey().equals("user_id")) {
                out = REGEXP + entry.getValue();
            } else {
                out = EQUALS + SINGLE_QUOTE + entry.getValue() + SINGLE_QUOTE;
            }
        }

        return out;
    }

}
