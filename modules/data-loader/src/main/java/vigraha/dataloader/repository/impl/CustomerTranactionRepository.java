package vigraha.dataloader.repository.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import vigraha.dataloader.repository.TransactionRepository;

import java.sql.SQLException;

public class CustomerTranactionRepository implements TransactionRepository{

    private static final Logger logger = LoggerFactory.getLogger(CustomerTranactionRepository.class);

    private JdbcTemplate jdbcTemplate;

    private static final String SAVE_SQL_STATEMENT = " insert into `customer`(`id`,`msisdn`,`name`,`city`) values (?, ?, ?, ?);";

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void save(String record, String columnSeparator) throws SQLException {
        String[] columnValues = record.split(columnSeparator , -1);
        logger.info("Inserting record [{}] to customer table",record);
        System.out.println(columnValues[0]);
        jdbcTemplate.update(SAVE_SQL_STATEMENT, columnValues[0],columnValues[1],columnValues[2],columnValues[3]);
    }
}
