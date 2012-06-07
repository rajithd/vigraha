package vigraha.rule.repository.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.rule.domain.Promotion;
import vigraha.rule.repository.RuleFindRepository;
import vigraha.rule.util.ExecutorStatus;
import vigraha.rule.util.TableHandler;

import java.sql.ResultSet;
import java.sql.SQLException;


public class PromotionRuleFindRepositoryImpl implements RuleFindRepository, TableHandler{

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleFindRepositoryImpl.class);
    private JdbcTemplate jdbcTemplate;

    @Override
    public void find() {
        //find rule to execute
            // check the rul already in table . if not insert it
        // move rule to another table with PENDING state
        logger.info("Finding closest rule date to execute");
        Promotion promotion = findClosestDate();
        logger.info("Check whether the rule already in PROMOTION_RULE_EXECUTOR table");
        if(isRuleAlreadyInTable(promotion.getPromotionId())){
            logger.info("Rule already in PROMOTION_RULE_EXECUTOR table. Id : [{}]", promotion.getPromotionId());
        } else {
            logger.info("Rule not in the table. Inserting the new rule to PROMOTION_RULE_EXECUTOR table");
            insertExecutableRuleToTable(promotion);
        }


    }

    private Promotion findClosestDate(){
        String sql = "select promotion_id,start_date,end_date,promotion_number,execute_time from "
                + TABLE_PROMOTION + " where end_date > now() order by end_date limit 1;";
        logger.info("SQL : [{}]",sql);
        return jdbcTemplate.queryForObject(sql, new RowMapper<Promotion>() {
            @Override
            public Promotion mapRow(ResultSet resultSet, int i) throws SQLException {
                Promotion promotion = new Promotion();
                promotion.setPromotionId(Integer.parseInt(resultSet.getString("promotion_id")));
                promotion.setStartDate(resultSet.getString("start_date"));
                promotion.setEndDate(resultSet.getString("end_date"));
                promotion.setPromotionNumber(resultSet.getString("promotion_number"));
                promotion.setExecuteTime(resultSet.getString("execute_time"));
                return promotion;
            }
        });
    }

    private boolean isRuleAlreadyInTable(int id){
        String sql = "select count(*) from " + TABLE_PROMOTION_RULE_EXECUTOR + " where promotion_rule_id=?";
        logger.info("checking sql : [{}]",sql);
        int count = jdbcTemplate.queryForInt(sql,id);
        if(count > 0) return true;
        else return false;
    }

    private void insertExecutableRuleToTable(Promotion promotion){
        logger.info("Inserting New rule to PROMOTION_RULE_EXECUTOR table with promotion_rule_id : [{}]", promotion.getPromotionId());
        String sql = "insert into " + TABLE_PROMOTION_RULE_EXECUTOR + "(`promotion_rule_id`,`start_date`,`end_date`,`execute_time`,`promotion_number`,`status`) " +
                "values(?,?,?,?,?,?);";
        jdbcTemplate.update(sql,promotion.getPromotionId(),promotion.getStartDate(),promotion.getEndDate(),promotion.getExecuteTime(),promotion.getPromotionNumber(),
                ExecutorStatus.PENDING.toString());

        logger.info("Insert successful");
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
