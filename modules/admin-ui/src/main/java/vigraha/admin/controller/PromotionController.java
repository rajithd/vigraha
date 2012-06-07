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
import vigraha.admin.repository.PromotionRepository;

@Controller
@RequestMapping("/promotion")

public class PromotionController {

    private final static Logger logger = LoggerFactory.getLogger(PromotionController.class);

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private PromotionRepository promotionRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String promotions(Model model)
    {
        System.out.println("====================Promotion load===========================");
        return "promotion";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String savePromotion(@RequestParam("programname") String programname , @RequestParam("startdate") String startdate ,
                                @RequestParam("starttime") String starttime , @RequestParam("enddate") String enddate ,
                                @RequestParam("endtime") String endtime ,@RequestParam("type") String type ,
                                @RequestParam("promotion") String promotion , @RequestParam("promotionnumber") String promotionnumber ,
                                @RequestParam("subscribers") String subscribers ,
                                @RequestParam("randomlyselect") String randomlyselect ,
                                @RequestParam("numberoffirstsubscribers") String numberoffirstsubscribers ,
                                @RequestParam("numberofsubscribers") String numberofsubscribers ,
                                @RequestParam("whomade") String whomade , @RequestParam("call") String call ,
                                @RequestParam("smsmessage") String smsmessage)
    {
        System.out.println("========================promotion============================");
        if(promotionRepository.isSuccessfullSavePromotion(programname,startdate,starttime,enddate,endtime,
                type,promotion,promotionnumber,subscribers,randomlyselect,numberoffirstsubscribers,numberofsubscribers,
                whomade,call,smsmessage))
        {
            return "promotion";
        }
        else
        {
            return "redirect:/login-error";
        }

    }
}
