package vigraha.rule.service.impl;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.domain.PromotionJobDetail;
import vigraha.rule.job.PromotionJob;
import vigraha.rule.repository.impl.PromotionRuleExecutorRepository;
import vigraha.rule.service.RuleExecutor;
import vigraha.rule.util.TableHandler;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
            logger.info("Get Execution time : [{}]" , promotionExecutor.getExecuteTime());
            try {
                Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
                PromotionJobDetail promotionJobDetail = new PromotionJobDetail("promotion",null, PromotionJob.class);

                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                Date fireTime = simpleDateFormat.parse(promotionExecutor.getExecuteTime());
                logger.info("Setting fire time : [{}]" , fireTime.toString());
                logger.info("Job Event will fire on [{}]" , fireTime.toString());
                Trigger trigger = new SimpleTrigger("promotoionJob","promo group",fireTime);
                promotionJobDetail.setJobId(++id);
                scheduler.start();
                scheduler.scheduleJob(promotionJobDetail,trigger);
            } catch (SchedulerException e) {
                logger.error("Error occur while executing the Job scheduler");
            } catch (ParseException e) {
                logger.error("Error occur while parsing the date");
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
}
