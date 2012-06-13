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
            logger.info(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,," + promotionExecutor.getBasedOn());
            try {
                logger.info("=======================>>>>");
                Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
                PromotionJobDetail promotionJobDetail = new PromotionJobDetail("promotion",null, PromotionJob.class);

                Calendar cal = Calendar.getInstance();
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date fireTime = simpleDateFormat.parse(promotionExecutor.getExecuteTime());
                logger.info("=======================>>>>");
                logger.info(fireTime.toString());
                Trigger trigger = new SimpleTrigger("promtoionjob","promo group",fireTime);
                promotionJobDetail.setJobId(++id);
                scheduler.start();
                scheduler.scheduleJob(promotionJobDetail,trigger);
            } catch (SchedulerException e) {
                logger.info("e======================xeption");
            } catch (ParseException e) {
                logger.info("dateeeeeeeeeeeeeeeeeeeee");
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
