package vigraha.rule.service.impl;


import vigraha.rule.service.RuleFinderExecutor;
import vigraha.rule.util.ExecutorStatus;

public class PromotionRuleFinderExecutorImpl implements RuleFinderExecutor {

    private int poolSize;

    @Override
    public void execute(){
        System.out.println("===================================");
        System.out.println(ExecutorStatus.EXECUTED);
    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }
}
