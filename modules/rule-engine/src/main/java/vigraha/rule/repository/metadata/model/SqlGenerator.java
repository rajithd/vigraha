package vigraha.rule.repository.metadata.model;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class SqlGenerator {

    private static final String SPACE = " ";
    private static final String EQUALS = " = ";
    private static final String SINGLE_QUOTE = "'";
    private static final HashSet<String> NULL_LOGIC_VALUES;

    static {
        NULL_LOGIC_VALUES = new HashSet<String>();
        for (NULL_LOGIC logic : NULL_LOGIC.values()) {
            NULL_LOGIC_VALUES.add(logic.toString());
        }
    }

    public static String createSQL(List<String> columns, TABLES table) {
        validateColumnSelection(columns);
        StringBuilder builder = new StringBuilder("select ");
        builder.append(columns.toString().replaceAll("\\[|\\]", ""));
        builder.append(" from ").append(table.toString());
        return builder.toString();
    }

    public static String createSelectSQLWithWhere(List<String> columns, Map<String, String> searchValues, TABLES table, LOGIC logic) {
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

    private static void validateColumnSelection(List<String> columns) {
        if (columns.size() == 0) {
            throw new RuntimeException("Atlest one select column must be selected");
        }
    }

    public DynamicStreamResultSet getDynamicResultSet(String query, DataSource dataSource, boolean withOption) {
        DynamicStreamResultSet dynamicResultSet = null;
        try {
            Connection connection = dataSource.getConnection();
            Statement stmt;
            if (withOption) {
                stmt = connection.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
                stmt.setFetchSize(Integer.MIN_VALUE);
            } else {
                stmt = connection.createStatement();
            }
            ResultSet resultSet = stmt.executeQuery(query);
            dynamicResultSet = new DynamicStreamResultSet(resultSet, connection, stmt);
        } catch (SQLException e) {
        }
        return dynamicResultSet;
    }

    private static String createParam(Map.Entry<String, String> entry) {
        String out;
        if (NULL_LOGIC_VALUES.contains(entry.getValue())) {
            out = " " + entry.getValue();
        } else {
            if (entry.getKey().equals("user_id")) {
                out = " like '%" + entry.getValue() + "%'";
            } else {
                out = EQUALS + SINGLE_QUOTE + entry.getValue() + SINGLE_QUOTE;
            }
        }

        return out;
    }

    public enum LOGIC {
        OR, AND, NOT
    }

    public enum NULL_LOGIC {
        IS_NULL {
            @Override
            public String toString() {
                return "is NULL";
            }
        }, IS_NOT_NULL {
            @Override
            public String toString() {
                return "is not NULL";
            }
        }
    }

    public enum TABLES {
        SUBSCRIBERS {
            @Override
            public String toString() {
                return name().toLowerCase();
            }
        }
    }
}
