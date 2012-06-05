package vigraha.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vigraha.admin.repository.PromotionRepository;

@Controller
@RequestMapping("/promotion")

public class PromotionController {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private PromotionRepository promotionRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String save(@RequestParam("programname") String programname , @RequestParam("startdate") String startdate ,
                     @RequestParam("enddate") String enddate , @RequestParam("smstype") String smstype ,
                     @RequestParam("voicecalltype") String voicecalltype , @RequestParam("smspromotion") String smspromotion ,
                     @RequestParam("lbspromotion") String lbspromotion , @RequestParam("voicecallpromotion") String voicecallpromotion ,
                     @RequestParam("gprspromotion") String gprspromotion , @RequestParam("ussdpromotion") String ussdpromotion ,
                     @RequestParam("promotionnumber") int promotionnumber ,
                     @RequestParam("executetime") String executetime , @RequestParam("randomlyselect") String randomlyselect ,
                     @RequestParam("numberoffirstsubscribers") int numberoffirstsubscribers ,
                     @RequestParam("numberofsubscribers") int numberofsubscribers ,
                     @RequestParam("whomade") String whomade , @RequestParam("call") String call ,
                     @RequestParam("smsmessage") String smsmessage)
    {
        if(promotionRepository.isSuccessfullSavePromotion(programname,startdate,enddate,smstype,
                voicecalltype,smspromotion,lbspromotion,voicecallpromotion,gprspromotion,ussdpromotion,promotionnumber,
                executetime,randomlyselect,numberoffirstsubscribers,numberofsubscribers,whomade,call,smsmessage))
        {
            return "promotion";
        }
        else
        {
            return "loginerror";
        }

    }
}
