package vigraha.admin.service;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import vigraha.admin.domain.Company;
import javax.swing.tree.TreePath;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Collection;

public class CompanyService {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

     public List<Company> findAllCompanies()
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
            return companyList;
        }


    }

}



