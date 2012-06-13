package vigraha.rule.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.repository.impl.PromotionRuleExecutorRepository;

public class PromotionJob implements Job{

    private static final Logger logger = LoggerFactory.getLogger(PromotionJob.class);

    @Autowired
    private PromotionRuleExecutorRepository promotionRuleExecutorRepository;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        printHeader();
        logger.info("============== MAIN RULE JOB STARTED =================");
        if(promotionRuleExecutorRepository.isPendingRuleExistsInPromotionExecutor()){
            logger.info("Find rule to execute");
            PromotionExecutor promotionExecutor = promotionRuleExecutorRepository.getPendingRuleFromPromotionRuleExecutor();


        }


    }

    private void printHeader(){
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
