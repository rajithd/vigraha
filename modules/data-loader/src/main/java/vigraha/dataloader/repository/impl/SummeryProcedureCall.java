package vigraha.dataloader.repository.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.SQLException;

public class SummeryProcedureCall {
    private JdbcTemplate jdbcTemplate;
    private static final Logger logger = LoggerFactory.getLogger(SummeryProcedureCall.class);

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void save() throws SQLException {
        logger.info("Calling Summery Procedure");
        jdbcTemplate.update("CALL InsertToSummery()");
        logger.info("Summery Procedure Completed");
    }
}
