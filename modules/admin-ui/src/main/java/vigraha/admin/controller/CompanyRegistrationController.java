package vigraha.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vigraha.admin.repository.CompanyRegisterRepository;

@Controller
@RequestMapping("/company-registration")

public class CompanyRegistrationController {

    private final static Logger logger = LoggerFactory.getLogger(AdminRegistrationController.class);

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private CompanyRegisterRepository companyRegisterRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String company_registration(Model model)
    {
        logger.info("=========Retrieving company registration==================");
        return "company-registration";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(@RequestParam("companyname") String companyname , @RequestParam("regno") String regno,
                             @RequestParam("tele1") String tele1 , @RequestParam("tele2") String tele2 ,
                             @RequestParam("address") String address,@RequestParam("email") String email,
                             @RequestParam("username") String username , @RequestParam("password") String password)
    {

        logger.info("=========================company register===========================");
        if(companyRegisterRepository.isSuccessInsertCompany(companyname,regno,tele1,tele2,address,email,username,password))
        {
            logger.info("Successfully registered company");
            return "company-registration";
        }

        else
        {
            logger.info("Company register not success");
            return "redirect:/loginerror";
        }

    }
}
