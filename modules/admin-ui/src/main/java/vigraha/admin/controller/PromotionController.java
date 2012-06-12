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
import vigraha.admin.domain.CompanyPromotion;
import vigraha.admin.repository.PromotionRepository;
import vigraha.admin.domain.Promotion;

import java.util.ArrayList;
import java.util.List;

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
        Promotion promotion = new Promotion();
        model.addAttribute("promotion",promotion);
        return "promotion";
    }

    @ModelAttribute("companyTypes")
    public List<Promotion> populateCompanyPromotion(){
        return promotionRepository.getAllCompanyList();
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(Promotion promotion){
        int id = 0;
        String companyCode = promotion.getCompanyCode();
        String promotionName = promotion.getPromotionName();
        String startDate = promotion.getStartDate();
        String startTime = promotion.getStartTime();
        String endDate = promotion.getEndDate();
        String endTime = promotion.getEndTime();

        List<String> basedOnList = getBasedOnValues(promotion); // sms , lbs , voice call , gprs , ussd
        String basedOnMessage = formatMessage(basedOnList);

        String promotionNumber = promotion.getPromotionNumber();
        String cycleTimeName = getCycleTimeName(promotion); // execute every , promotion end , specific time
        String cycleTimeValue = getCycleTimeValue(promotion); // take values for cycle time
        String processRestriction = getProcessRestriction(promotion); // do not repeate subscribers , repeate subscribers
        String selectMechanismName = getSelectionMechanismName(promotion); // random , 1st subscriber , all
        String selectMechanismValue = getSelectionMechanismValue(promotion); //take values for Selection Mechanism
        String age1 = promotion.getAge1();
        String age2 = promotion.getAge2();
        String smsMessage = promotion.getSmsMessage();

        if(promotionRepository.isSuccessfullSavePromotion(id,companyCode,promotionName,startDate,startTime,endDate,endTime,
                                basedOnMessage,promotionNumber,cycleTimeName,cycleTimeValue,processRestriction,selectMechanismName,
                                 selectMechanismValue,age1,age2,smsMessage))
        {
            logger.info("Successfully registered promotion");
            return "promotion";
        }

        else
        {
            logger.info("Company register not success");
            return "redirect:/loginerror";
        }


        //return "promotion";
    }

    private String formatMessage(List<String> basedOnList) {   // use to check whether user select more options
        boolean isFirst = true;
        String message ="";
        for (String s : basedOnList){
            if(isFirst){
                message += s;
                isFirst = false;
            } else {
                message += ","+s;
            }
        }
        return message;
    }

    private String getCycleTimeName(Promotion promotion){
        String message = null;
        if(promotion.getCycleTime().equals("executeEvery")){
            message = "EXECUTE_EVERY";
        } else if(promotion.getCycleTime().equals("specificTime")) {
            message = "SPECIFIC_TIME";
        }  else {
            message = "PROMOTIO_END";
        }
        return message;
    }

    private String getCycleTimeValue(Promotion promotion) {
        String cycleTime = null;
        if(promotion.getCycleTime().equals("executeEvery")){
            cycleTime = promotion.getHours();
        } else if(promotion.getCycleTime().equals("specificTime")) {
            cycleTime = promotion.getSpecificTime();
        } else {
            cycleTime = "none";
        }
        return cycleTime;
    }

    private String getProcessRestriction(Promotion promotion){
        String message = null;
        if(promotion.getProcessingRestriction().equals("doNotRepeat")){
            message = "DO_NOT_REPEAT";
        } else if(promotion.getProcessingRestriction().equals("repeat")) {
            message = "REPEAT";
        }
        return message;
    }
    
    private String getSelectionMechanismName(Promotion promotion){
        String message = null;
        if(promotion.getSelectMechanism().equals("random")){
            message = "RANDOM";
        } else if(promotion.getSelectMechanism().equals("firstSubscribers")){
            message = "FIRST_SUBSCRIBERS";
        } else if(promotion.getSelectMechanism().equals("all")){
            message = "ALL";
        }

        return message;
    }

    private String getSelectionMechanismValue(Promotion promotion) {
        String selectMechanism = null;
        if(promotion.getSelectMechanism().equals("random")){
            selectMechanism = promotion.getRandomCount();
        } else if(promotion.getSelectMechanism().equals("firstSubscribers")) {
            selectMechanism = promotion.getRandomCount1();
        } else {
            selectMechanism = "none";
        }
        return selectMechanism;
    }

    private List<String> getBasedOnValues(Promotion promotion){
        List<String> messageList = new ArrayList<String>();
        if(promotion.getBasedOn().get("sms") != null){
            messageList.add("SMS");
        }
        if(promotion.getBasedOn().get("lbs") != null){
            messageList.add("LBS");
        }
        if(promotion.getBasedOn().get("voicecall") != null){
            messageList.add("VOICE");
        }
        if(promotion.getBasedOn().get("gprs") != null){
            messageList.add("GPRS");
        }
        if(promotion.getBasedOn().get("ussd") != null){
            messageList.add("USSD");
        }

        return messageList;
    }
}
