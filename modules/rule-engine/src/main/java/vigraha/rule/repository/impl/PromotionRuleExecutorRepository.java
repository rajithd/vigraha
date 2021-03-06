package vigraha.rule.repository.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.rule.domain.Customer;
import vigraha.rule.domain.Promotion;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.domain.VoiceCall;
import vigraha.rule.service.WinnerSelectionProcess;
import vigraha.rule.util.ExecutorStatus;
import vigraha.rule.util.TableHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PromotionRuleExecutorRepository implements TableHandler {

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleExecutorRepository.class);

    private JdbcTemplate jdbcTemplate;
    private WinnerSelectionProcess winnerSelectionProcess;

    public PromotionExecutor getPendingRuleFromPromotionRuleExecutor() {
        String sql = "select rule_id,promotion_rule_id,start_date,end_date,execute_time,promotion_number,based_on from "
                + TABLE_PROMOTION_RULE_EXECUTOR + " where status = ?;";
        logger.info("Getting pending rule from promotion rule executor , SQL : [{}]" , sql);
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
        winnerSelectionProcess.executeSQL("select count(*) from promotion_rule_executor");
        int count = jdbcTemplate.queryForInt(sql, ExecutorStatus.PENDING.toString());
        logger.info("Number of PENDING rule found in [{}] : [{}]", TABLE_PROMOTION_RULE_EXECUTOR, count);
        if (count > 0) return true;
        else return false;
    }

    public List<VoiceCall> getResultsBasedOnPromotionNumber(String promotionNumber){
        logger.info("Getting results in voice call. Promotion number is  : [{}] " , promotionNumber);
        String sql = "select number_make_call,call_result from voice_call where number_receive_call = ?;";
        winnerSelectionProcess.executeSQL("select count(*) from voice_call");
        logger.info("getResultsBasedOnPromotionNumber SQL : [{}]" , sql);
        List<VoiceCall> voiceCallList = jdbcTemplate.query(sql, new RowMapper<VoiceCall>() {
            @Override
            public VoiceCall mapRow(ResultSet resultSet, int i) throws SQLException {
                VoiceCall voiceCall = new VoiceCall();
                voiceCall.setNumberMakingCall(resultSet.getString("number_make_call"));
                voiceCall.setCallResult(resultSet.getString("call_result"));
                return voiceCall;
            }
        }, promotionNumber);

        return voiceCallList;
    }

    public Customer getCustomerBasedOnVoiceCall(String numberMakingCall){
        logger.info("Getting customers based on number that make call : [{}]" , numberMakingCall);
        String sql = "select id,msisdn,name,city from customer where msisdn = ? ;";
        winnerSelectionProcess.executeSQL("select count(*) from customer");
        logger.info("getCustomerBasedOnVoiceCall SQL: [{}]", sql);
        return jdbcTemplate.queryForObject(sql, new RowMapper<Customer>() {
            @Override
            public Customer mapRow(ResultSet resultSet, int i) throws SQLException {
                Customer customer = new Customer();
                customer.setId(resultSet.getString("id"));
                customer.setMsisdn(resultSet.getString("msisdn"));
                customer.setName(resultSet.getString("name"));
                customer.setCity(resultSet.getString("city"));
                return customer;
            }
        }, numberMakingCall);
    }

    public boolean isOverPassTime(){
        logger.info("Checking is there any rule to execute");
        String sql = "select count(*) from " + TABLE_PROMOTION_RULE_EXECUTOR + " where execute_time <= now() and status=? order by execute_time limit 1;";
        int count = jdbcTemplate.queryForInt(sql, ExecutorStatus.PENDING.toString());
        logger.info("Number of rules to execute : [{}]", count);
        if (count > 0) return true;
        else return false;
    }

    public void insertMsisdnToPromotionSendMsisdnTable(PromotionExecutor promotionExecutor, String msisdn, String status){
        logger.info("Inserting values to promotion send msisdn table");
        String sql = "insert into promotion_send_msisdn values(?,?,?,?);";
        jdbcTemplate.update(sql,promotionExecutor.getId(),promotionExecutor.getPromotionRuleId(),msisdn,status);
        logger.info("Insert successfull to promotion_send_msisdn table");

    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void updatePromotionRuleExecutorStatus(int id,String success) {
        String sql = "update " + TABLE_PROMOTION_RULE_EXECUTOR + " set status= ? where rule_id=?";
        jdbcTemplate.update(sql,success,id);
        logger.info("Rule status updated successfull");
    }

    public void setWinnerSelectionProcess(WinnerSelectionProcess winnerSelectionProcess) {
        this.winnerSelectionProcess = winnerSelectionProcess;
    }
}
