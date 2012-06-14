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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PromotionRepository {

    private final static Logger logger = LoggerFactory.getLogger(PromotionRepository.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean isSuccessfullSavePromotion(int id, String companyCode, String promotionName, String startDate,
                                              String startTime, String endDate, String endTime, String basedOnMessage,
                                              String promotionNumber, String cycleTimeName, String cycleTimeValue,
                                              String processRestriction, String selectMechanismName,
                                              String selectMechanismValue, String age1, String age2, String smsMessage) {

//        String date = "20" + "3";
//         logger.info("date [{}]" , date);


        String start_date_time = startDate + " " + startTime.concat(":00");
        String new_start = stringToDate(start_date_time);
        String end_date_time = endDate + " " + endTime.concat(":00");
        String new_end = stringToDate(end_date_time);

        String age = age1 + "," + age2;

        int row = jdbcTemplate.update("insert into `promotion` values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", id, companyCode, promotionName,
                new_start, new_end, basedOnMessage, promotionNumber, cycleTimeName, cycleTimeValue,
                processRestriction, selectMechanismName, selectMechanismValue, age, smsMessage, "admin", "CREATE");

        System.out.println("************" + row);

        if (row > 0)
            return true;
        else
            return false;

    }

    public List<Promotion> getAllCompanyList() {
        List<Promotion> promotionList = jdbcTemplate.query("select * from company", new RowMapper<Promotion>() {
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

    private String stringToDate(String value) {
        String[] dateTime = value.split(" ");
        String dateArr[] = dateTime[0].split("-");
        String newValue = dateArr[2] + "-" + dateArr[0] + "-" + dateArr[1] + " " + dateTime[1];
        String newDate = null;
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = (Date)formatter.parse(newValue);
            newDate = formatter.format(date);
        } catch (ParseException e) {

        }

        return newDate;
    }
}
