package vigraha.reporting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import vigraha.reporting.domain.Promotion;
import vigraha.reporting.repository.PromotionDailyRepository;

import java.util.List;

@Controller
@RequestMapping("/promotionDailyReport")
public class PromotionDailyReportController {

    @Autowired
    private PromotionDailyRepository promotionDailyRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String redirect(Model model){
        Promotion promotion = new Promotion();
        model.addAttribute("promotion",promotion);
        return "promotionDailyReport";

    }

    @ModelAttribute("PromotionTypes")
    public List<Promotion> populatePromotionName(){
        return promotionDailyRepository.getPromotionNameAndCompanyCode();
    }

}
