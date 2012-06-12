package vigraha.reporting.repository;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.reporting.domain.Promotion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PromotionDailyRepository {

    private JdbcTemplate jdbcTemplate;

    public List<Promotion> getPromotionNameAndCompanyCode(){
        List<Promotion> promotionList = jdbcTemplate.query("select promotion.promotion_id,promotion.promotion_name,promotion.company_code from " +
                "promotion, promotion_rule_executor where promotion.promotion_id=promotion_rule_executor.promotion_rule_id", new RowMapper<Promotion>() {
            public Promotion mapRow(ResultSet resultSet, int i) throws SQLException {
                Promotion promotion = new Promotion();
                promotion.setPromotionId(resultSet.getString("promotion_id"));
                promotion.setPromotionName(resultSet.getString("promotion_name"));
                promotion.setCompanyCode(resultSet.getString("company_code"));
                return promotion;
            }
        });

        return promotionList;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
