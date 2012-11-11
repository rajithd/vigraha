package vigraha.rule.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class WinnerSelectionProcess {

    private static final Logger logger = LoggerFactory.getLogger(WinnerSelectionProcess.class);

    private DataSource hiveDataSource;

    public void executeSQL(String sql) {
        logger.info("Hive SQL [{}]" ,sql);
        Connection hiveConnection = null;
        try{
            hiveConnection = hiveDataSource.getConnection();
            Statement stmt = hiveConnection.createStatement();
            ResultSet res = null;
            res = stmt.executeQuery(sql);
            res.close();
        } catch (Exception e){

        } finally {
            if (hiveConnection != null) {
                try {
                    hiveConnection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public void setHiveDataSource(DataSource hiveDataSource) {
        this.hiveDataSource = hiveDataSource;
    }
}
