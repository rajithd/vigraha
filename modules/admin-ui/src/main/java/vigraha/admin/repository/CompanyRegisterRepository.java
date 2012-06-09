package vigraha.admin.repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.admin.domain.Company;
import javax.swing.tree.TreePath;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CompanyRegisterRepository {

    private final static Logger logger = LoggerFactory.getLogger(CompanyRegisterRepository.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean isSuccessInsertCompany(String companyname,String regno,String tele1,String tele2,
                                          String address,String email,String username,String password)
    {
        int row = jdbcTemplate.update("insert into `company` values(?,?,?,?,?,?,?,?)" ,  companyname , regno ,
                                        tele1 , tele2 , address, email , username , password);

        System.out.println("************" + row);
        if(row < 1)
            return false;
        else
            return true;
    }

    public Collection findAllCompanies()
    {

        return this.jdbcTemplate.query("select company_name , company_reg_no from company" , new CompanyMapper());
    }

    private static final class CompanyMapper implements RowMapper
    {

        public List<Company> mapRow(ResultSet rs, int rowNum) throws SQLException {
            List<Company> companyList = new ArrayList<Company>();
            Company company = new Company();
            company.setCompany_name(rs.getString("company_name"));
            company.setReg_no(rs.getString("company_reg_no"));
            companyList.add(company);
            logger.info("================success=========");
            return companyList;
        }


    }



}
