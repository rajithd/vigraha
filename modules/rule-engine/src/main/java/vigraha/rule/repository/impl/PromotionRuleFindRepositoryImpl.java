package vigraha.rule.repository.impl;

import org.springframework.jdbc.core.JdbcTemplate;
import vigraha.rule.repository.RuleFindRepository;
import vigraha.rule.util.TableHandler;


public class PromotionRuleFindRepositoryImpl implements RuleFindRepository, TableHandler{

    private JdbcTemplate jdbcTemplate;

    @Override
    public void find() {

        //find rule to execute
        // move rule to another table with PENDING state

    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
