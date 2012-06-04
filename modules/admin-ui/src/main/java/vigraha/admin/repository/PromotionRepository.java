package vigraha.admin.repository;

import org.springframework.jdbc.core.JdbcTemplate;

public class PromotionRepository {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean isSuccessfullSavePromotion(String programname,String startdate,String enddate,
                                              String smstype,String voicecalltype,String smspromotion,
                                              String lbspromotion,String voicecallpromotion,String gprspromotion,
                                              String ussdpromotion,int promotionnumber,String executetime,
                                              String randomlyselect,int numberoffirstsubscribers,int numberofsubscribers,
                                              String whomade,String call,String smsmessage)
    {
        int row = jdbcTemplate.update("insert into `admin` values(?,?,?,?,?,?,?,?,?,?,?)" , programname , startdate , enddate ,
                smstype , voicecalltype , smspromotion , lbspromotion , voicecallpromotion , gprspromotion , ussdpromotion ,
                promotionnumber , executetime , randomlyselect , numberoffirstsubscribers , numberofsubscribers ,
                whomade , call , smsmessage);

        if(row == -1)
            return false;
        else
            return true;

    }

}
