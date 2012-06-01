package vigraha.admin.controller;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/promotion")

public class PromotionController {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping(method = RequestMethod.POST)
    public void save(@RequestParam("program_name") String program_name , @RequestParam("start_date") String start_date ,
                     @RequestParam("end_date") String end_date , @RequestParam("promotion_number") int promotion_number ,
                     @RequestParam("execute_time") String execute_time , @RequestParam("randomly_select") String randomly_select ,
                     @RequestParam("number_of_first_subscribers") int number_of_first_subscribers ,
                     @RequestParam("number_of_subscribers") int number_of_subscribers ,
                     @RequestParam("who_made") String who_made , @RequestParam("call") String call ,
                     @RequestParam("sms_message") String sms_message)
    {
        jdbcTemplate.update("insert into `admin` values(?,?,?,?,?,?,?,?,?,?,?)" , program_name , start_date , end_date ,
                promotion_number , execute_time , randomly_select , number_of_first_subscribers , number_of_subscribers ,
                who_made , call , sms_message);
    }
}
