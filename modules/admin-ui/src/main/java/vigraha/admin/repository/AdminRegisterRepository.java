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

     public boolean isSuccessfulSave(String fullname,String mobileno,String id,String username,
                                     String password)
     {
         //String md5 = MD5Encrypter.encryptPassword(password);

         int row = jdbcTemplate.update("insert into `admin` values(?,?,?,?,?)" , fullname , mobileno ,
                                        id , username , password);

         System.out.println("************" + row);
         if(row < 1)
             return false;
         else
             return true;
     }
}
