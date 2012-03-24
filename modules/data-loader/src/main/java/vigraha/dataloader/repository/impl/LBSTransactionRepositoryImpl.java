package vigraha.dataloader.repository.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import vigraha.dataloader.repository.TransactionRepository;

import java.sql.SQLException;

public class LBSTransactionRepositoryImpl implements TransactionRepository {

    private static final Logger logger = LoggerFactory.getLogger(LBSTransactionRepositoryImpl.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void save(String record, String columnSeparator) throws SQLException {
        String[] columnValues = record.split(columnSeparator);
        jdbcTemplate.update("insert into `lbs` values(?,?,?,?,?)" , columnValues[0],columnValues[1],
                columnValues[2], columnValues[3], columnValues[4]);
    }

}
