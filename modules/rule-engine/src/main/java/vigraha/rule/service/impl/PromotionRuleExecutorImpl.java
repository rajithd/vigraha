package vigraha.rule.service.impl;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import vigraha.rule.domain.Customer;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.domain.PromotionJobDetail;
import vigraha.rule.domain.VoiceCall;
import vigraha.rule.job.PromotionJob;
import vigraha.rule.repository.impl.PromotionRuleExecutorRepository;
import vigraha.rule.service.RuleExecutor;
import vigraha.rule.util.TableHandler;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class PromotionRuleExecutorImpl implements RuleExecutor, TableHandler {

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleExecutorImpl.class);
    private static long id = 0;

    private int poolSize;

    private PromotionRuleExecutorRepository promotionRuleExecutorRepository;

    @Override
    public void execute() {
        logger.info("======================== Rule Executor scheduler stared =============== ");
        if (promotionRuleExecutorRepository.isPendingRuleExistsInPromotionExecutor()) {
            logger.info("Starting to execute PENDING rules in [{}]", TABLE_PROMOTION_RULE_EXECUTOR);
            PromotionExecutor promotionExecutor = promotionRuleExecutorRepository.getPendingRuleFromPromotionRuleExecutor();
            logger.info("Get Execution time : [{}]", promotionExecutor.getExecuteTime());
            if (promotionRuleExecutorRepository.isOverPassTime()) {
                printHeader();
                logger.info(" ============= Executing rule ==============");
                List<VoiceCall> voiceCallList = promotionRuleExecutorRepository.getResultsBasedOnPromotionNumber(promotionExecutor.getPromotionNumber());
                List<Customer> customerList = new ArrayList<Customer>();
                for(VoiceCall voiceCall : voiceCallList){
                    Customer customer = new Customer();
                    customer = promotionRuleExecutorRepository.getCustomerBasedOnVoiceCall(voiceCall.getNumberMakingCall());
                    customerList.add(customer);
                }
                logger.info("========================= Number of customers found =================== ");
                logger.info("[{}]", customerList.size());

                for(Customer customer: customerList){
                    logger.info("Inserting phone number [{}]", customer.getMsisdn());
                    promotionRuleExecutorRepository.insertMsisdnToPromotionSendMsisdnTable(promotionExecutor,customer.getMsisdn(),"SUCCESS");
                }

                promotionRuleExecutorRepository.updatePromotionRuleExecutorStatus(promotionExecutor.getId(),"SUCCESS");
            }

        } else {
            logger.info("No rule find to execute");
        }

    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }

    public void setPromotionRuleExecutorRepository(PromotionRuleExecutorRepository promotionRuleExecutorRepository) {
        this.promotionRuleExecutorRepository = promotionRuleExecutorRepository;
    }

    private void printHeader() {
        logger.info("  _____  _    _ _      ______       _____ _______       _____ _______ ______ _____  \n" +
                " |  __ \\| |  | | |    |  ____|     / ____|__   __|/\\   |  __ \\__   __|  ____|  __ \\ \n" +
                " | |__) | |  | | |    | |__       | (___    | |  /  \\  | |__) | | |  | |__  | |  | |\n" +
                " |  _  /| |  | | |    |  __|       \\___ \\   | | / /\\ \\ |  _  /  | |  |  __| | |  | |\n" +
                " | | \\ \\| |__| | |____| |____      ____) |  | |/ ____ \\| | \\ \\  | |  | |____| |__| |\n" +
                " |_|  \\_\\\\____/|______|______|    |_____/   |_/_/    \\_\\_|  \\_\\ |_|  |______|_____/ \n" +
                "                                                                                    \n" +
                "                                                                                    ");
    }
}
