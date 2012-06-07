package vigraha.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/welcome")

public class WelcomeController {
   @RequestMapping(method = RequestMethod.GET)
    public String welcome(Model model)
    {
        System.out.println("================Welcome load============================");
        return "welcome";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String goPromotion()
    {
        return "promotion";
    }

}
