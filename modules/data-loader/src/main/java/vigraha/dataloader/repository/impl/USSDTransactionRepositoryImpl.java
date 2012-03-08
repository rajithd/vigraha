package vigraha.dataloader.repository.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import vigraha.dataloader.repository.TransactionRepository;

import java.sql.SQLException;

public class USSDTransactionRepositoryImpl implements TransactionRepository {

    private static final Logger logger = LoggerFactory.getLogger(USSDTransactionRepositoryImpl.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void save(String record, String columnSeparator) throws SQLException {
        String[] columnValues = record.split(columnSeparator);
        jdbcTemplate.update("insert into `ussd` values(?,?,?,?,?,?,?,?)" , columnValues[0],columnValues[1],
                columnValues[2], columnValues[3], columnValues[4], columnValues[5], columnValues[6], columnValues[7]);
    }

}
