package vigraha.admin.domain;

import java.util.Map;

public class Promotion {
    private String companyName;
    private String companyCode;
    private String displayName;
    private String promotionName;
    private String startDate;
    private String startTime;
    private String endDate;
    private String endTime;
    private Map<String,String> basedOn; // sms , lbs , voice call , gprs , ussd
    private String promotionNumber;
    private String cycleTime; // execute every , promotion end , specific time
    private String processingRestriction; // do not repeate subscribers , repeate subscribers
    private String selectMechanism; // random , 1st subscriber , all
    private String age1;
    private String age2;
    private int numberOfSubscribers;
    private String smsMessage;
    private String hours;  // take value for Execute Every
    private String specificTime; // take value for Execute at Specific Time
    private String randomCount; // take value for Randomly Select
    private String randomCount1; // take value for Number of First Subscribers

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDisplayName() {
        return getCompanyName() + "(" + getCompanyCode() + ")";
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    public String getPromotionName() {
        return promotionName;
    }

    public void setPromotionName(String promotionName) {
        this.promotionName = promotionName;
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

    public String getPromotionNumber() {
        return promotionNumber;
    }

    public void setPromotionNumber(String promotionNumber) {
        this.promotionNumber = promotionNumber;
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

    public String getAge1() {
        return age1;
    }

    public void setAge1(String age1) {
        this.age1 = age1;
    }

    public String getAge2() {
        return age2;
    }

    public void setAge2(String age2) {
        this.age2 = age2;
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

    public String getRandomCount() {
        return randomCount;
    }

    public void setRandomCount(String randomCount) {
        this.randomCount = randomCount;
    }

    public String getRandomCount1() {
        return randomCount1;
    }

    public void setRandomCount1(String randomCount1) {
        this.randomCount1 = randomCount1;
    }
}
