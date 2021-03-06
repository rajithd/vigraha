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
import vigraha.admin.domain.AdminRegister;
import vigraha.admin.repository.AdminRegisterRepository;

@Controller
@RequestMapping("/admin-registration")
public class AdminRegistrationController {

    private final static Logger logger = LoggerFactory.getLogger(AdminRegistrationController.class);

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private AdminRegisterRepository adminRegisterRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String redirect(Model model) {
        AdminRegister admin = new AdminRegister();
        model.addAttribute("admin", admin);
        return "admin-registration";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(AdminRegister adminRegister) {
        String id = adminRegister.getId();
        String userName = adminRegister.getUsername();
        String passWord = adminRegister.getPassword();

        if (adminRegisterRepository.isSuccessfulSave(id, userName, passWord)) {
            logger.info("Successfully registered admin");
            return "admin-registration";
        } else {
            logger.info("Admin register not success");
            return "redirect:/login-error";
        }

    }

}
