package vigraha.admin.repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.admin.domain.Company;
import vigraha.admin.domain.CompanyPromotion;
import vigraha.admin.domain.Promotion;

import javax.swing.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PromotionRepository {

    private final static Logger logger = LoggerFactory.getLogger(PromotionRepository.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean isSuccessfullSavePromotion(int id,String companyCode,String promotionName,String startDate,
                                              String startTime,String endDate,String endTime,String basedOnMessage,
                                              String promotionNumber,String cycleTimeName,String cycleTimeValue,
                                              String processRestriction,String selectMechanismName,String selectMechanismValue,String smsMessage)
    {

//        String date = "20" + "3";
//         logger.info("date [{}]" , date);


       String start_date_time = startDate + " " + startTime;

       String end_date_time = endDate + " " + endTime;

       //String age = agerestriction1 + "," + agerestriction2;

        int row = jdbcTemplate.update("insert into `promotion` values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" , id ,companyCode,promotionName,
               start_date_time,end_date_time,basedOnMessage,promotionNumber,cycleTimeName,cycleTimeValue,
                processRestriction,selectMechanismName,selectMechanismValue,smsMessage,"admin","ADD");

        System.out.println("************" + row);

        if(row > 0)
            return true;
        else
            return false;

    }

    public List<Promotion> getAllCompanyList(){
        List<Promotion> promotionList = jdbcTemplate.query("select * from company" , new RowMapper<Promotion>() {
            @Override
            public Promotion mapRow(ResultSet resultSet, int i) throws SQLException {
                Promotion promotion = new Promotion();
                promotion.setCompanyCode(resultSet.getString("company_reg_no"));
                promotion.setCompanyName(resultSet.getString("company_name"));
                return promotion;
            }
        });

        return promotionList;

    }

}
