package vigraha.rule.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import vigraha.rule.domain.PromotionExecutor;
import vigraha.rule.repository.impl.PromotionRuleExecutorRepository;
import vigraha.rule.service.RuleExecutor;
import vigraha.rule.util.TableHandler;

public class PromotionRuleExecutorImpl implements RuleExecutor, TableHandler {

    private static final Logger logger = LoggerFactory.getLogger(PromotionRuleExecutorImpl.class);

    private int poolSize;

    private PromotionRuleExecutorRepository promotionRuleExecutorRepository;

    @Override
    public void execute() {
        logger.info("======================== Rule Executor scheduler stared =============== ");
        if (promotionRuleExecutorRepository.isPendingRuleExistsInPromotionExecutor()) {
            logger.info("Starting to execute PENDING rules in [{}]", TABLE_PROMOTION_RULE_EXECUTOR);
            PromotionExecutor promotionExecutor = promotionRuleExecutorRepository.getPendingRuleFromPromotionRuleExecutor();
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
