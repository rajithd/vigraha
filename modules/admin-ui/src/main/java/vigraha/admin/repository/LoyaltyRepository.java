package vigraha.admin.repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.admin.domain.Company;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class LoyaltyRepository {
    private final static Logger logger = LoggerFactory.getLogger(PromotionRepository.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean saveLoyalty(int id, String companyCode, String loyaltyName, String startDate,
                                 String startTime, String endDate, String endTime, String basedOnMessage,
                                 String loyaltyNumber, String cycleTimeName, String cycleTimeValue,
                                 String processRestriction, String selectMechanismName,
                                 String selectMechanismValue, String age1, String age2, String smsMessage) {

        String start_date_time = startDate + " " + startTime + ":00";
        String new_start = stringToDate(start_date_time);
        String end_date_time = endDate + " " + endTime + ":00";
        String new_end = stringToDate(end_date_time);
        cycleTimeValue = new_end;

        String age = age1 + "," + age2;

        int row = jdbcTemplate.update("insert into `loyalty` values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", id, companyCode, loyaltyName,
                new_start, new_end, basedOnMessage, loyaltyNumber, cycleTimeName, cycleTimeValue,
                processRestriction, selectMechanismName, selectMechanismValue, age, smsMessage, "admin", "CREATE");


        if (row > 0)
            return true;
        else
            return false;
    }

    public List<Company> getAllCompanyList() {
        List<Company> companyList = jdbcTemplate.query("select * from company", new RowMapper<Company>() {
            @Override
            public Company mapRow(ResultSet resultSet, int i) throws SQLException {
                Company company = new Company();
                company.setCompanyName(resultSet.getString("company_name"));
                company.setRegNo(resultSet.getString("company_reg_no"));
                return company;
            }
        });

        return companyList;

    }

    private String stringToDate(String value) {
        String newDate = null;
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date1 = (Date)formatter.parse(value);
            newDate = formatter.format(date1);
        } catch (ParseException e) {
            logger.error("Error while converting string to date");
        }
        return newDate;
    }
}
