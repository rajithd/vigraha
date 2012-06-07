package vigraha.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login-error")


public class LoginErrorController {

    private final static Logger logger = LoggerFactory.getLogger(LoginErrorController.class);

    @RequestMapping(method = RequestMethod.GET)
public String loginError(Model model)
    {
        logger.info("==========Retrieving login error page============");
        return "login-error";
    }

}
