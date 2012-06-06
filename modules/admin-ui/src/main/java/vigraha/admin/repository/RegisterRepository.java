package vigraha.admin.repository;

import org.springframework.jdbc.core.JdbcTemplate;

public class RegisterRepository {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

     public boolean isSuccessfulSave(String firstname,String lastname,String mobilenumber,String yearofbirth,
                                     String profession,String username,String password,String securityquestion,
                                     String nic,String address,String country,String province,String city)
     {
         int row = jdbcTemplate.update("insert into `admin` values(?,?,?,?,?,?,?,?,?,?,?,?,?)" , firstname , lastname,
                 mobilenumber , yearofbirth , profession , username , password , securityquestion , nic , address ,
                 country , province , city);

         System.out.println("************" + row);
         if(row < 1)
             return false;
         else
             return true;
     }
}
