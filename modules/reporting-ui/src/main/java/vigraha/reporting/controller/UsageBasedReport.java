package vigraha.reporting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsageBasedReport {

    @RequestMapping(value = "/yearly-usage-based-report" ,method = RequestMethod.GET)
    public String redirectYearly(Model model){
        return "usageBasedReport";
    }

    @RequestMapping(value = "/monthly-usage-based-report" ,method = RequestMethod.GET)
    public String redirectMonthly(Model model){
        return "usageBasedReport";
    }
}
