package vigraha.admin.controller;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("/home")
public class HomeController {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model){
        System.out.println("======================================");
        return "home";
    }

    @RequestMapping(method = RequestMethod.POST)
    public void submitForm(@RequestParam("username") String username, @RequestParam("password") String password)
    {
       jdbcTemplate.execute("select `user_name` from `admin` where ");

    }


}
