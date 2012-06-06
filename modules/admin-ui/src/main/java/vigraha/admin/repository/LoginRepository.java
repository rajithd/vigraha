package vigraha.admin.repository;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.admin.domain.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class LoginRepository {

    private final static Logger logger = LoggerFactory.getLogger(LoginRepository.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean isSuccessfulAuthentication(String username, String password){
        logger.info("Checking username [{}]" ,username);
        String sql = "select count(*) from admin where username='"+username+"' and password='"+password+"'";
        logger.info("SQL : [{}]" , sql);
        int row = jdbcTemplate.queryForInt(sql);
        if(row > 0) return true;
        else return false;

    }


}
