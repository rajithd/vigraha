package vigraha.admin.repository;

import org.springframework.jdbc.core.JdbcTemplate;

public class PromotionRepository {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //public boolean isSuccessfullSavePromotion()
}
