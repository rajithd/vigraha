package vigraha.rule.repository.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.rule.domain.Promotion;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.util.ExecutorStatus;
import vigraha.rule.util.TableHandler;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PromotionRuleExecutorRepository implements TableHandler {

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleExecutorRepository.class);

    private JdbcTemplate jdbcTemplate;

    public PromotionExecutor getPendingRuleFromPromotionRuleExecutor() {
        String sql = "select rule_id,promotion_rule_id,start_date,end_date,execute_time,promotion_number,based_on from "
                + TABLE_PROMOTION_RULE_EXECUTOR + " where status = ?;";
        return jdbcTemplate.queryForObject(sql, new RowMapper<PromotionExecutor>() {
            @Override
            public PromotionExecutor mapRow(ResultSet resultSet, int i) throws SQLException {
                PromotionExecutor promotionExecutor = new PromotionExecutor();
                promotionExecutor.setId(Integer.parseInt(resultSet.getString("rule_id")));
                promotionExecutor.setPromotionRuleId(Integer.parseInt(resultSet.getString("promotion_rule_id")));
                promotionExecutor.setStartDate(resultSet.getString("start_date"));
                promotionExecutor.setEndDate(resultSet.getString("end_date"));
                promotionExecutor.setExecuteTime(resultSet.getString("execute_time"));
                promotionExecutor.setPromotionNumber(resultSet.getString("promotion_number"));
                promotionExecutor.setBasedOn(resultSet.getString("based_on"));
                return promotionExecutor;
            }
        }, ExecutorStatus.PENDING.toString());
    }

    public boolean isPendingRuleExistsInPromotionExecutor() {
        String sql = "select count(*) from " + TABLE_PROMOTION_RULE_EXECUTOR + " where status=?";
        int count = jdbcTemplate.queryForInt(sql, ExecutorStatus.PENDING.toString());
        logger.info("Number of PENDING rule found in [{}] : [{}]", TABLE_PROMOTION_RULE_EXECUTOR, count);
        if (count > 0) return true;
        else return false;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
