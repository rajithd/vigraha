package vigraha.admin.domain;

public class Promotion {
    private String program_name;
    private String start_date;
    private String end_date;
    //
    //
    private int promotion_number;
    private String execute_time;
    //
    private String randomly_select;
    private int number_of_first_subscribers;
    private int number_of_subscribers;
    private String who_made;
    private String call;
    private String sms_message;

    public Promotion()
    {}

    public Promotion(String program_name , String start_date , String end_date , int promotion_number ,
                     String execute_time , String randomly_select , int number_of_first_subscribers ,
                     int number_of_subscribers , String who_made ,String call ,String sms_message)
    {
        this.program_name = program_name;
        this.start_date = start_date;
        this.end_date = end_date;
        this.promotion_number = promotion_number;
        this.execute_time = execute_time;
        this.randomly_select = randomly_select;
        this.number_of_first_subscribers = number_of_first_subscribers;
        this.number_of_subscribers = number_of_subscribers;
        this.who_made = who_made;
        this.call = call;
        this.sms_message = sms_message;
    }

    public String getProgram_name()
    {
        return program_name;
    }

    public String getStart_data()
    {
        return start_date;
    }

    public String getEnd_date()
    {
        return end_date;
    }

    public int getPromotion_number()
    {
        return promotion_number;
    }

    public String getExecute_time()
    {
        return execute_time;
    }

    public String getRandomly_select()
    {
        return randomly_select;
    }

    public int getNumber_of_first_subscribers()
    {
        return number_of_first_subscribers;
    }

    public int getNumber_of_subscribers()
    {
        return number_of_subscribers;
    }

    public String getWho_made()
    {
        return who_made;
    }

    public String getCall()
    {
        return call;
    }

    public String getSms_message()
    {
        return sms_message;
    }

    public void setProgram_name(String program_name)
    {
        this.program_name = program_name;
    }

    public void setStart_date(String start_date)
    {
        this.start_date = start_date;
    }

    public void setEnd_date(String end_date)
    {
        this.end_date = end_date;
    }

    public void setPromotion_number(int promotion_number)
    {
        this.promotion_number = promotion_number;
    }

    public void setExecute_time(String execute_time)
    {
        this.execute_time = execute_time;
    }

    public void setRandomly_select(String randomly_select)
    {
        this.randomly_select = randomly_select;
    }

    public void setNumber_of_first_subscribers(int number_of_first_subscribers)
    {
        this.number_of_first_subscribers = number_of_first_subscribers;
    }

    public void setNumber_of_subscribers(int number_of_subscribers)
    {
        this.number_of_subscribers = number_of_subscribers;
    }

    public void setWho_made(String who_made)
    {
        this.who_made = who_made;
    }

    public void setCall(String call)
    {
        this.call = call;
    }

    public void setSms_message(String sms_message)
    {
        this.sms_message = sms_message;
    }
}
