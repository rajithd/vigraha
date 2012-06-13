package vigraha.rule.repository.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.rule.domain.Customer;
import vigraha.rule.domain.Promotion;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.domain.VoiceCall;
import vigraha.rule.util.ExecutorStatus;
import vigraha.rule.util.TableHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PromotionRuleExecutorRepository implements TableHandler {

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleExecutorRepository.class);

    private JdbcTemplate jdbcTemplate;

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
        int count = jdbcTemplate.queryForInt(sql, ExecutorStatus.PENDING.toString());
        logger.info("Number of PENDING rule found in [{}] : [{}]", TABLE_PROMOTION_RULE_EXECUTOR, count);
        if (count > 0) return true;
        else return false;
    }

    public List<VoiceCall> getResultsBasedOnPromotionNumber(String promotionNumber){
        String sql = "select number_make_call,call_result from voice_call where number_receive_call = ?;";
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
    
    public Customer getCustomerBasedOnVoiceCall(VoiceCall voiceCall){
        String sql = "select id,msisdn,name,city from customer where msisdn = ? ;";
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
        }, voiceCall.getNumberMakingCall());
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
