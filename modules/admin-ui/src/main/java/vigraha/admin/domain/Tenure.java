package vigraha.admin.domain;

import java.util.Map;

public class Tenure {
    private String companyCode;
    private String tenureName;
    private String startDate;
    private String startTime;
    private String endDate;
    private String endTime;
    private Map<String,String> basedOn; // sms , lbs , voice call , gprs , ussd
    private String tenureNumber;
    private String cycleType; // execute every , promotion end , specific time
    private String cycleTime; // execute every , promotion end , specific time
    private String processingRestriction; // do not repeate subscribers , repeate subscribers
    private String selectMechanism; // random , 1st subscriber , all
    private int numberOfSubscribers;
    private String smsMessage;
    private String hours;  // take value for Execute Every
    private String specificTime; // take value for Execute at Specific Time

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    public String getTenureName() {
        return tenureName;
    }

    public void setTenureName(String tenureName) {
        this.tenureName = tenureName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Map<String, String> getBasedOn() {
        return basedOn;
    }

    public void setBasedOn(Map<String, String> basedOn) {
        this.basedOn = basedOn;
    }

    public String getTenureNumber() {
        return tenureNumber;
    }

    public void setTenureNumber(String tenureNumber) {
        this.tenureNumber = tenureNumber;
    }

    public String getCycleType() {
        return cycleType;
    }

    public void setCycleType(String cycleType) {
        this.cycleType = cycleType;
    }

    public String getCycleTime() {
        return cycleTime;
    }

    public void setCycleTime(String cycleTime) {
        this.cycleTime = cycleTime;
    }

    public String getProcessingRestriction() {
        return processingRestriction;
    }

    public void setProcessingRestriction(String processingRestriction) {
        this.processingRestriction = processingRestriction;
    }

    public String getSelectMechanism() {
        return selectMechanism;
    }

    public void setSelectMechanism(String selectMechanism) {
        this.selectMechanism = selectMechanism;
    }

    public int getNumberOfSubscribers() {
        return numberOfSubscribers;
    }

    public void setNumberOfSubscribers(int numberOfSubscribers) {
        this.numberOfSubscribers = numberOfSubscribers;
    }

    public String getSmsMessage() {
        return smsMessage;
    }

    public void setSmsMessage(String smsMessage) {
        this.smsMessage = smsMessage;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getSpecificTime() {
        return specificTime;
    }

    public void setSpecificTime(String specificTime) {
        this.specificTime = specificTime;
    }
}
