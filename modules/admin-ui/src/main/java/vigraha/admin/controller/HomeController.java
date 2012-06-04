package vigraha.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vigraha.admin.repository.LoginRepository;

import java.util.Date;

@Controller
@RequestMapping("/home")
public class HomeController {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private LoginRepository loginRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model){
        System.out.println("======================================");
        return "home";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(@RequestParam("username") String username, @RequestParam("password") String password)
    {
        System.out.println("=====================================================================");
        System.out.println("==========" + loginRepository.isSuccessfulAuthentication(username,password));
        if(loginRepository.isSuccessfulAuthentication(username,password)){
            return "home";
        } else {
            return "loginerror";
        }
    }


}
