package vigraha.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vigraha.admin.repository.PromotionRepository;
import vigraha.admin.service.CompanyService;
import vigraha.admin.domain.Company;
import vigraha.admin.domain.Promotion;

import java.util.List;

@Controller
@RequestMapping("/promotion")

public class PromotionController {

    private final static Logger logger = LoggerFactory.getLogger(PromotionController.class);

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private PromotionRepository promotionRepository;
    @Autowired
    private CompanyService companyService;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String promotions(Model model)
    {
        Company company = new Company();
        model.addAttribute("company",company);
        System.out.println("====================Promotion load===========================");
        return "promotion";
    }

//    @ModelAttribute("companies")
//    public List<Company> populateCompny()
//    {
//        return CompanyService.findAllCompanies();
//    }

    @RequestMapping(method = RequestMethod.POST)
    public String savePromotion(@RequestParam("companycode") String companycode ,
                                @RequestParam("promotionname") String promotionname , @RequestParam("startdate") String startdate ,
                                @RequestParam("starttime") String starttime ,
                                @RequestParam("enddate") String enddate ,@RequestParam("endtime") String endtime ,
                                @RequestParam("sms") String sms , @RequestParam("lbs") String lbs ,
                                @RequestParam("voicecall") String voicecall , @RequestParam("gprs") String gprs ,
                                @RequestParam("ussd") String ussd ,
                                @RequestParam("promotionnumber") String promotionnumber , @RequestParam("executeevery") String executeevery ,
                                @RequestParam("specifictime") String specifictime,@RequestParam("promotionend") String promotionend ,
                                @RequestParam("donotrepeate") String donotrepeate , @RequestParam("repeate") String repeate ,
                                @RequestParam("random") String random ,
                                @RequestParam("firstsub") String firstsub ,
                                @RequestParam("all") String all , @RequestParam("agerestriction1") String agerestriction1 ,
                                @RequestParam("agerestriction2") String agerestriction2 , @RequestParam("smsmessage") String smsmessage)
    {


   int id = 0;

        logger.info("========================promotion============================");
        if(promotionRepository.isSuccessfullSavePromotion(id,companycode,promotionname,startdate,starttime,enddate,endtime,
                sms,lbs,voicecall,gprs,ussd,promotionnumber,executeevery,
                specifictime,promotionend,donotrepeate,repeate,random,
                firstsub,all,agerestriction1,agerestriction2,smsmessage))
        {
            return "promotion";
        }
        else
        {
            return "redirect:/login-error";
        }

    }
}
