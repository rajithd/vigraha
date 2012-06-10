package vigraha.dataloader.repository.impl;

import org.springframework.jdbc.core.JdbcTemplate;
import vigraha.dataloader.repository.TransactionRepository;

import java.sql.SQLException;

public class SummeryProcedureCall implements TransactionRepository {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void save(String record, String columnSeparator) throws SQLException {
        jdbcTemplate.update("CALL InsertToSummery()");
    }
}
