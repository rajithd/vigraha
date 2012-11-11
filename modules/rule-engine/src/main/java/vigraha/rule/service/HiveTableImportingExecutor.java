package vigraha.rule.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.rule.repository.metadata.DataBaseMetaDataService;
import vigraha.rule.repository.metadata.model.Table;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;

public class HiveTableImportingExecutor extends TableImportExecutor {

    private static final Logger logger = LoggerFactory.getLogger(HiveTableImportingExecutor.class);

    private DataBaseMetaDataService dataBaseMetaDataService;
    private DataSource hiveDataSource;
    private DataSource relationalDataSource;
    private ExecutorService executorService;

    public void execute() throws Exception {
        logger.info("=======================================================================");
        logger.info("Hive Table Importer Starting...");
        logger.info("=======================================================================");
        Set<String> tablesToSync = new HashSet<String>();
        tablesToSync.addAll(getAllTableNames());

        CountDownLatch countDownLatch = new CountDownLatch(tablesToSync.size());

        for (String tableName : tablesToSync) {
            TableImporterCallable importerCallable = new TableImporterCallable(
                    dataBaseMetaDataService, tableName,
                    hiveDataSource, relationalDataSource, countDownLatch);
            executorService.submit(importerCallable);
        }

        countDownLatch.await();

        logger.info("=======================================================================");
        logger.info("Hive Table Importer Done");
        logger.info("=======================================================================");


    }


    private List<String> getAllTableNames() {
        List<Table> allTables = dataBaseMetaDataService.getAllTablesInDatabase();

        List<String> tableNames = new ArrayList<String>(allTables.size());
        for (Table table : allTables) {
            tableNames.add(table.getName());
        }

        return tableNames;
    }

    public void setDataBaseMetaDataService(DataBaseMetaDataService dataBaseMetaDataService) {
        this.dataBaseMetaDataService = dataBaseMetaDataService;
    }

    public void setHiveDataSource(DataSource hiveDataSource) {
        this.hiveDataSource = hiveDataSource;
    }

    public void setRelationalDataSource(DataSource relationalDataSource) {
        this.relationalDataSource = relationalDataSource;
    }

    public void setExecutorService(ExecutorService executorService) {
        this.executorService = executorService;
    }
}
