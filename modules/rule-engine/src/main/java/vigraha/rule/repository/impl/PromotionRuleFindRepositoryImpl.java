package vigraha.rule.repository.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.rule.domain.Promotion;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.repository.RuleFindRepository;
import vigraha.rule.util.CycleType;
import vigraha.rule.util.ExecutorStatus;
import vigraha.rule.util.PromotionStatus;
import vigraha.rule.util.TableHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class PromotionRuleFindRepositoryImpl implements RuleFindRepository, TableHandler{

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleFindRepositoryImpl.class);
    private JdbcTemplate jdbcTemplate;

    @Override
    public void find() {
        logger.info("======== Finding closest rule date to execute ==========");
        Promotion promotion = findClosestDate();
        if(isExistsPromotionExecutorPending()){
            logger.info("Found 1 record with pending status");
            PromotionExecutor promotionExecutor = getPromotionExecutor();
            if(compareDateTime(getExecuteTime(promotion),promotionExecutor.getExecuteTime())){
                String executeTime = getExecuteTime(promotion);
                logger.info("Get new execute time : [{}]" , executeTime);
                deletePreviousPromotionFromPromotionExecutor(promotionExecutor.getPromotionRuleId());
                insertExecutableRuleToTable(promotion, executeTime);
                updatePromotionStatusToAdded(promotion);
                updatePromotionStatusToCreate(promotionExecutor);
            }
        } else {
            logger.info("No Pending Rule found in Promotion Executor");
            String executeTime = getExecuteTime(promotion);
            insertExecutableRuleToTable(promotion, executeTime);
            updatePromotionStatusToAdded(promotion);
        }
    }

    private String getExecutionTime(Promotion promotion){
        if(promotion.getCycleType().equals(CycleType.PROMOTION_END.toString())){
            return promotion.getEndDate();
        } else {                            // CycleType.SPECIFIC_TIME
            return promotion.getCycleTime();
        }

    }

    private void updatePromotionStatusToCreate(PromotionExecutor promotionExecutor) {
        logger.info("Update promotion id [{}] to CREATE status"  + promotionExecutor.getPromotionRuleId());
        String sql = "update " + TABLE_PROMOTION + " set promotion_status= ? where promotion_id=?";
        jdbcTemplate.update(sql,PromotionStatus.CREATE.toString(),promotionExecutor.getPromotionRuleId());
    }

    private void updatePromotionStatusToAdded(Promotion promotion) {
        logger.info("Update promotion id [{}] to ADD status"  + promotion.getPromotionId());
        String sql = "update " + TABLE_PROMOTION + " set promotion_status= ? where promotion_id=?";
        jdbcTemplate.update(sql,PromotionStatus.ADD.toString(),promotion.getPromotionId());
    }

    private void deletePreviousPromotionFromPromotionExecutor(int promotionId) {
        logger.info("Delete previous promotion from promotion_executor table with promotion id: [{}]", promotionId);
        String sql = "delete from " + TABLE_PROMOTION_RULE_EXECUTOR + " where promotion_rule_id=" + promotionId;
        logger.info("SQL : [{}]", sql);
        jdbcTemplate.update(sql);
    }

    private Promotion findClosestDate(){
        String sql = "select promotion_id,start_date_time,end_date_time,promotion_number,cycle_type,cycle_time,based_on from "
                + TABLE_PROMOTION + " where promotion_status=? and end_date_time > now() order by end_date_time limit 1;";
        logger.info("SQL : [{}]", sql);
        return jdbcTemplate.queryForObject(sql, new RowMapper<Promotion>() {
            @Override
            public Promotion mapRow(ResultSet resultSet, int i) throws SQLException {
                Promotion promotion = new Promotion();
                promotion.setPromotionId(Integer.parseInt(resultSet.getString("promotion_id")));
                promotion.setStartDate(resultSet.getString("start_date_time"));
                promotion.setEndDate(resultSet.getString("end_date_time"));
                promotion.setPromotionNumber(resultSet.getString("promotion_number"));
                promotion.setCycleType(resultSet.getString("cycle_type"));
                promotion.setCycleTime(resultSet.getString("cycle_time"));
                promotion.setBasedOn(resultSet.getString("based_on"));
                return promotion;
            }
        }, PromotionStatus.CREATE.toString());
    }

    private void insertExecutableRuleToTable(Promotion promotion, String executeTime){
        logger.info("Inserting New rule to PROMOTION_RULE_EXECUTOR table with promotion_rule_id : [{}]", promotion.getPromotionId());
        String sql = "insert into " + TABLE_PROMOTION_RULE_EXECUTOR + "(`promotion_rule_id`,`start_date`,`end_date`,`execute_time`,`promotion_number`,`based_on`,`status`) " +
                "values(?,?,?,?,?,?,?);";
        jdbcTemplate.update(sql,promotion.getPromotionId(),promotion.getStartDate(),promotion.getEndDate(),executeTime,promotion.getPromotionNumber(),promotion.getBasedOn(),
                ExecutorStatus.PENDING.toString());

        logger.info("Insert successful");
    }
    
    private String getExecuteTime(Promotion promotion){
        if(promotion.getCycleType().equals(CycleType.PROMOTION_END.toString())){
            return promotion.getEndDate();
        } else if(promotion.getCycleType().equals(CycleType.SPECIFIC_TIME.toString())){
            return promotion.getCycleTime();
        }
        return null;
    }
    
    private boolean isExistsPromotionExecutorPending(){
        logger.info("Check whether the pending status is exists");
        String sql = "select count(*) from " + TABLE_PROMOTION_RULE_EXECUTOR + " where status=?";
        logger.info("checking sql : [{}]",sql);
        int count = jdbcTemplate.queryForInt(sql,ExecutorStatus.PENDING.toString());
        if(count > 0) return true;
        else return false;
    }

    private PromotionExecutor getPromotionExecutor(){
        logger.info("Get Promotion Executor");
        String sql = "select promotion_rule_id,execute_time from promotion_rule_executor where status= ?";
        return jdbcTemplate.queryForObject(sql, new RowMapper<PromotionExecutor>() {
            @Override
            public PromotionExecutor mapRow(ResultSet resultSet, int i) throws SQLException {
                PromotionExecutor promotionExecutor = new PromotionExecutor();
                promotionExecutor.setPromotionRuleId(Integer.parseInt(resultSet.getString("promotion_rule_id")));
                promotionExecutor.setExecuteTime(resultSet.getString("execute_time"));
                return promotionExecutor;
            }
        }, ExecutorStatus.PENDING.toString());
    }

    private boolean compareDateTime(String promotionTime, String executorTime){
        Calendar promotionCal = Calendar.getInstance();
        Calendar executorCal = Calendar.getInstance();
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try{
            promotionCal.setTime(s.parse(promotionTime));
            executorCal.setTime(s.parse(executorTime));
            if(promotionCal.before(executorCal)){
                return true;
            }
        } catch (ParseException e){
            logger.error("Error while parsing date");
        }

        return false;

    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
