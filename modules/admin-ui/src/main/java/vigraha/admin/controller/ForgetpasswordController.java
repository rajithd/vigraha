package vigraha.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/forget-password")

public class ForgetpasswordController {
    private final static Logger logger = LoggerFactory.getLogger(ForgetpasswordController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String forgetPassword(Model model)
    {
        logger.info("==========Retrieving Forget password page============");
        return "forget-password";
    }
}
