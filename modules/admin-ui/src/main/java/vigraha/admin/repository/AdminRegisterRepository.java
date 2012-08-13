package vigraha.admin.repository;

import java.math.*;
import java.security.*;
import org.springframework.jdbc.core.JdbcTemplate;
import vigraha.admin.service.MD5Encrypter;

import java.security.MessageDigest;

public class AdminRegisterRepository {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

     public boolean isSuccessfulSave(String id,String username,String password) {
         String encryptPassword = MD5Encrypter.encryptPassword(password);

         int row = jdbcTemplate.update("insert into `login` values(?,?,?)" ,id , username , password);
         jdbcTemplate.update("insert into `authority` values(?,?)" , id, "ROLE_ADMIN");
         jdbcTemplate.update("insert into `authority` values(?,?)" , id, "ROLE_PROGRAMME");
         jdbcTemplate.update("insert into `authority` values(?,?)" , id, "ROLE_COMPANY_REGISTER");
         jdbcTemplate.update("insert into `authority` values(?,?)" , id, "ROLE_VIEW_REPORT");

         if(row < 1)
             return false;
         else
             return true;
     }
}
