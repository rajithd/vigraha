package vigraha.admin.domain;

import java.util.Map;

public class Promotion {
    private String company_code;
    private String promotion_name;
    private String start_date;
    private String start_time;
    private String end_date;
    private String end_time;
    private Map<String,String>getbasedOn; // sms , lbs , voice call , gprs , ussd
    private int promotion_number;
    private String cycle_time; // execute every , promotion end , specific time
    private String processing_restriction; // do not repeate subscribers , repeate subscribers
    private String select_mechanism; // random , 1st subscriber , all
    private int age;
    private int numberofsubscribers;
    private String smsmessage;

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public void setPromotion_name(String promotion_name) {
        this.promotion_name = promotion_name;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public void setGetbasedOn(Map<String, String> getbasedOn) {
        this.getbasedOn = getbasedOn;
    }

    public void setPromotion_number(int promotion_number) {
        this.promotion_number = promotion_number;
    }

    public void setCycle_time(String cycle_time) {
        this.cycle_time = cycle_time;
    }

    public void setProcessing_restriction(String processing_restriction) {
        this.processing_restriction = processing_restriction;
    }

    public void setSelect_mechanism(String select_mechanism) {
        this.select_mechanism = select_mechanism;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setNumberofsubscribers(int numberofsubscribers) {
        this.numberofsubscribers = numberofsubscribers;
    }

    public void setSmsmessage(String smsmessage) {
        this.smsmessage = smsmessage;
    }

    public String getCompany_code() {
        return company_code;
    }

    public String getPromotion_name() {
        return promotion_name;
    }

    public String getStart_date() {
        return start_date;
    }

    public String getStart_time() {
        return start_time;
    }

    public String getEnd_date() {
        return end_date;
    }

    public String getEnd_time() {
        return end_time;
    }

    public Map<String, String> getGetbasedOn() {
        return getbasedOn;
    }

    public int getPromotion_number() {
        return promotion_number;
    }

    public String getCycle_time() {
        return cycle_time;
    }

    public String getProcessing_restriction() {
        return processing_restriction;
    }

    public String getSelect_mechanism() {
        return select_mechanism;
    }

    public int getAge() {
        return age;
    }

    public int getNumberofsubscribers() {
        return numberofsubscribers;
    }

    public String getSmsmessage() {
        return smsmessage;
    }
}
