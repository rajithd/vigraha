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
import vigraha.admin.domain.Company;
import vigraha.admin.domain.Loyalty;
import vigraha.admin.repository.LoyaltyRepository;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/loyalty")

public class LoyaltyController {

    private final static Logger logger = LoggerFactory.getLogger(LoginController.class);

    private JdbcTemplate jdbcTemplate;
    @Autowired
    private LoyaltyRepository loyaltyRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String loyalty(Model model)
    {
        Loyalty loyalty = new Loyalty();
        model.addAttribute("loyalty",loyalty);
        return "loyalty";
    }

    @ModelAttribute("companyTypes")
    public List<Company> populateCompanyLoyalty(){
        return loyaltyRepository.getAllCompanyList();
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(Loyalty loyalty)
    {
        int id = 0;
        String companyCode = loyalty.getCompanyCode();
        String loyaltyName = loyalty.getLoyaltyName();
        String startDate = loyalty.getStartDate();
        String startTime = loyalty.getStartTime();
        String endDate = loyalty.getEndDate();
        String endTime = loyalty.getEndTime();
//
        List<String> basedOnList = getBasedOnValues(loyalty); // sms , lbs , voice call , gprs , ussd
        String basedOnMessage = formatMessage(basedOnList);
//
        String loyaltyNumber = loyalty.getLoyaltyNumber();
        String cycleTimeName = getCycleTimeName(loyalty); // execute every , promotion end , specific time
        String cycleTimeValue = getCycleTimeValue(loyalty); // take values for cycle time
        String processRestriction = getProcessRestriction(loyalty); // do not repeate subscribers , repeate subscribers

        String selectMechanismName = getSelectionMechanismName(loyalty); // random , 1st subscriber , all
        String smsMessage = loyalty.getSmsMessage();

        if(loyaltyRepository.saveLoyalty(id, companyCode, loyaltyName, startDate, startTime, endDate, endTime,
                basedOnMessage, loyaltyNumber, cycleTimeName, cycleTimeValue, processRestriction, selectMechanismName,
                "ALL", "", "", smsMessage)) {
            logger.info("Successfully registered loyalty");
            return "promotion";
        }
//
        else {
            logger.info("Loyalty register not success");
            return "redirect:/promotion";
        }

    }

    private String getSelectionMechanismName(Loyalty loyalty) {
        String message = null;
        if(loyalty.getSelectMechanism().equals("random")){
            message = "RANDOM";
        } else if(loyalty.getSelectMechanism().equals("firstSubscribers")){
            message = "FIRST_SUBSCRIBERS";
        } else if(loyalty.getSelectMechanism().equals("all")){
            message = "ALL";
        }

        return message;
    }

    private String getProcessRestriction(Loyalty loyalty) {
        String message = null;
        if(loyalty.getProcessingRestriction().equals("doNotRepeat")){
            message = "DO_NOT_REPEAT";
        } else if(loyalty.getProcessingRestriction().equals("repeat")) {
            message = "REPEAT";
        }
        return message;
    }

    private String getCycleTimeValue(Loyalty loyalty) {
        String cycleTime = null;
        if(loyalty.getCycleTime().equals("executeEvery")){
            cycleTime = loyalty.getHours();
        } else if(loyalty.getCycleTime().equals("specificTime")) {
            cycleTime = loyalty.getSpecificTime();
        } else {
            cycleTime = "none";
        }
        return cycleTime;
    }

    private String getCycleTimeName(Loyalty loyalty) {
        String message = null;
        if(loyalty.getCycleTime().equals("executeEvery")){
            message = "EXECUTE_EVERY";
        } else if(loyalty.getCycleTime().equals("specificTime")) {
            message = "SPECIFIC_TIME";
        }  else {
            message = "PROMOTION_END";
        }
        return message;
    }

    private String formatMessage(List<String> basedOnList) {
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

    private List<String> getBasedOnValues(Loyalty loyalty) {
        List<String> messageList = new ArrayList<String>();
        if(loyalty.getBasedOn().get("sms") != null){
            messageList.add("SMS");
        }
        if(loyalty.getBasedOn().get("lbs") != null){
            messageList.add("LBS");
        }
        if(loyalty.getBasedOn().get("voicecall") != null){
            messageList.add("VOICE");
        }
        if(loyalty.getBasedOn().get("gprs") != null){
            messageList.add("GPRS");
        }
        if(loyalty.getBasedOn().get("ussd") != null){
            messageList.add("USSD");
        }

        return messageList;
    }

}

