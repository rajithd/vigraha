package vigraha.admin.controller;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vigraha.admin.domain.Registration;

@Controller
@RequestMapping("/registration")

public class RegistrationController {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    Registration r = new Registration();

       @RequestMapping(method = RequestMethod.POST)
       public void save(@RequestParam("first_name") String first_name , @RequestParam("last_name") String last_name ,
                        @RequestParam("mobile_number") String mobile_number , @RequestParam("year_of_birth") String year_of_birth ,
                        @RequestParam("profession") String profession , @RequestParam("user_name") String user_name ,
                        @RequestParam("password") String password , @RequestParam("confirm_password") String confirm_password ,
                        @RequestParam("security_question") String security_question , @RequestParam("nic") String nic ,
                        @RequestParam("address") String address , @RequestParam("country") String country ,
                        @RequestParam("province") String province , @RequestParam("city") String city)
       {
           jdbcTemplate.update("insert into `admin` values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" , first_name , last_name ,
                   mobile_number , year_of_birth , profession , user_name , password , confirm_password ,
                   security_question , nic , address , country , province , city);
       }

}
