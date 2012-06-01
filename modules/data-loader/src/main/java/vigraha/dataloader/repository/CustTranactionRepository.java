package vigraha.dataloader.repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import vigraha.dataloader.util.CustomerInfo;

public class CustTranactionRepository {

    private static final Logger logger = LoggerFactory.getLogger(CustTranactionRepository.class);

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void save(final CustomerInfo[] ci){
        
        String insertValues = "";

        insertValues = "("+ci[0].getAll()+")";
        for (int i=1; i<ci.length; i++){
            insertValues += ",("+ci[i].getAll()+")";
        }

        jdbcTemplate.update("INSERT INTO `customer` (`id`,`msisdn`,`name`,`city`) VALUES "+insertValues+";");
        
    }
}
