package vigraha.rule.service.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.rule.repository.RuleFindRepository;
import vigraha.rule.service.RuleFinderExecutor;
import vigraha.rule.util.ExecutorStatus;

public class PromotionRuleFinderExecutorImpl implements RuleFinderExecutor {

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleFinderExecutorImpl.class);
    private int poolSize;
    private RuleFindRepository ruleFindRepository;

    @Override
    public void execute(){
        logger.info("Starting to find nearest rule to execute....");
        ruleFindRepository.find();

    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }

    public void setRuleFindRepository(RuleFindRepository ruleFindRepository) {
        this.ruleFindRepository = ruleFindRepository;
    }
}
