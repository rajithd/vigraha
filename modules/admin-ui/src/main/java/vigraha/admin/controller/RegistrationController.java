package vigraha.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vigraha.admin.repository.RegisterRepository;

@Controller
@RequestMapping("/registration")

public class RegistrationController {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private RegisterRepository registerRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String registration(Model model)
    {
        return "registration";
    }

     @RequestMapping(method = RequestMethod.POST)
     public String submitForm(@RequestParam("firstname") String firstname , @RequestParam("lastname") String lastname ,
                        @RequestParam("mobilenumber") String mobilenumber , @RequestParam("yearofbirth") String yearofbirth ,
                        @RequestParam("profession") String profession , @RequestParam("username") String username ,
                        @RequestParam("password") String password ,
                        @RequestParam("securityquestion") String securityquestion , @RequestParam("nic") String nic ,
                        @RequestParam("address") String address , @RequestParam("country") String country ,
                        @RequestParam("province") String province , @RequestParam("city") String city)
       {
           if(registerRepository.isSuccessfulSave(firstname,lastname,mobilenumber,yearofbirth,profession,
                   username,password,securityquestion,nic,address,country,province,city))
           {
               return "registration";
           }
           else
           {
               return "loginerror";
           }

       }

}
