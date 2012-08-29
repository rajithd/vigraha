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
import vigraha.admin.domain.Promotion;
import vigraha.admin.domain.Tenure;
import vigraha.admin.repository.TenureRepository;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/tenure")

public class TenureController {

    private final static Logger logger = LoggerFactory.getLogger(TenureController.class);

    private JdbcTemplate jdbcTemplate;

    @Autowired
    private TenureRepository tenureRepository;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String tenures(Model model) {
        Tenure tenure = new Tenure();
        model.addAttribute("tenure",tenure);
        return "tenure";
    }

    @ModelAttribute("companyTypes")
    public List<Company> populateCompanyTenure(){
        return tenureRepository.getAllCompanyList();
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(Tenure tenure){
        int id = 0;
        String companyCode = tenure.getCompanyCode();
        String tenureName = tenure.getTenureName();
        String startDate = tenure.getStartDate();
        String startTime = tenure.getStartTime();
        String endDate = tenure.getEndDate();
        String endTime = tenure.getEndTime();
//
        List<String> basedOnList = getBasedOnValues(tenure); // sms , lbs , voice call , gprs , ussd
        String basedOnMessage = formatMessage(basedOnList);
//
        String tenureNumber = tenure.getTenureNumber();
        String cycleTimeName = getCycleTimeName(tenure); // execute every , promotion end , specific time
        String cycleTimeValue = getCycleTimeValue(tenure); // take values for cycle time
        String processRestriction = getProcessRestriction(tenure); // do not repeate subscribers , repeate subscribers

        String selectMechanismName = getSelectionMechanismName(tenure); // random , 1st subscriber , all
        String smsMessage = tenure.getSmsMessage();
//
        if(tenureRepository.saveTenure(id, companyCode, tenureName, startDate, startTime, endDate, endTime,
                basedOnMessage, tenureNumber, cycleTimeName, cycleTimeValue, processRestriction, selectMechanismName,
                "ALL", "", "", smsMessage)) {
            logger.info("Successfully registered tenure");
            return "promotion";
        }
//
        else {
            logger.info("Tenure register not success");
            return "redirect:/promotion";
        }

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

    private String getCycleTimeName(Tenure tenure){
        String message = null;
        if(tenure.getCycleTime().equals("executeEvery")){
            message = "EXECUTE_EVERY";
        } else if(tenure.getCycleTime().equals("specificTime")) {
            message = "SPECIFIC_TIME";
        }  else {
            message = "PROMOTION_END";
        }
        return message;
    }

    private String getCycleTimeValue(Tenure tenure) {
        String cycleTime = null;
        if(tenure.getCycleTime().equals("executeEvery")){
            cycleTime = tenure.getHours();
        } else if(tenure.getCycleTime().equals("specificTime")) {
            cycleTime = tenure.getSpecificTime();
        } else {
            cycleTime = "none";
        }
        return cycleTime;
    }

    private String getProcessRestriction(Tenure tenure){
        String message = null;
        if(tenure.getProcessingRestriction().equals("doNotRepeat")){
            message = "DO_NOT_REPEAT";
        } else if(tenure.getProcessingRestriction().equals("repeat")) {
            message = "REPEAT";
        }
        return message;
    }

    private String getSelectionMechanismName(Tenure tenure){
        String message = null;
        if(tenure.getSelectMechanism().equals("random")){
            message = "RANDOM";
        } else if(tenure.getSelectMechanism().equals("firstSubscribers")){
            message = "FIRST_SUBSCRIBERS";
        } else if(tenure.getSelectMechanism().equals("all")){
            message = "ALL";
        }

        return message;
    }

    private List<String> getBasedOnValues(Tenure tenure){
        List<String> messageList = new ArrayList<String>();
        if(tenure.getBasedOn().get("sms") != null){
            messageList.add("SMS");
        }
        if(tenure.getBasedOn().get("lbs") != null){
            messageList.add("LBS");
        }
        if(tenure.getBasedOn().get("voicecall") != null){
            messageList.add("VOICE");
        }
        if(tenure.getBasedOn().get("gprs") != null){
            messageList.add("GPRS");
        }
        if(tenure.getBasedOn().get("ussd") != null){
            messageList.add("USSD");
        }

        return messageList;
    }
}
