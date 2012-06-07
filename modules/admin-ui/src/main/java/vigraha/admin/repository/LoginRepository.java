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
       // System.out.println("inside repo : " + username + " " + password);
//        List<Admin> adminList = jdbcTemplate.query("select * from `admin` where `user_name`= ? and `pass_word` = ?", new RowMapper<Admin>() {
//            @Override
//            public Admin mapRow(ResultSet resultSet, int i) throws SQLException {
//                Admin admin = new Admin();
//                admin.setUsername(resultSet.getString(0));
//                admin.setPassword(resultSet.getString(1));
//                return admin;
//            }
//        }, username, password);
//
//        if(adminList.size() == 0) return false;
//        else return true;

       // int row = jdbcTemplate.queryForInt("select count(*) from admin where username='"+username+"' and password='"+password+"'");
       // System.out.println("====================" + row);
        logger.info("Checking username [{}]",username);
        String sql = "select count(*) from admin where username='"+username+"' and password='"+password+"'";
        logger.info("SQL : [{}]",sql);
        int row = jdbcTemplate.queryForInt(sql);
        if(row > 0) return true;
        else return false;

    }


}
