package vigraha.admin.repository;

import org.springframework.jdbc.core.JdbcTemplate;

public class PromotionRepository {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean isSuccessfullSavePromotion(String programname,String startdate, String starttime,
                                              String enddate,String endtime,
                                              String type,String promotion,String promotionnumber,
                                              String subscribers,String randomlyselect,
                                              String numberoffirstsubscribers,String numberofsubscribers,
                                              String whomade,String call,String smsmessage)
    {
        int row = jdbcTemplate.update("insert into `promotion` values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" , programname , startdate , starttime , enddate ,
                                       endtime , type , promotion , promotionnumber , subscribers , randomlyselect , numberoffirstsubscribers , numberofsubscribers ,
                                        whomade , call , smsmessage);

        System.out.println("************" + row);

        if(row > 0)
            return true;
        else
            return false;

    }

}
