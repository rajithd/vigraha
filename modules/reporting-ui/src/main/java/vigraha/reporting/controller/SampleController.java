package vigraha.reporting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sample")
public class SampleController {

    @RequestMapping(method = RequestMethod.GET)
    public String Sample(Model model)
    {
        System.out.println("==============================>>>");
        return "sample";
    }

}
