package vigraha.rule.service.impl;


import vigraha.rule.service.RuleFinderExecutor;

public class PromotionRuleFinderExecutorImpl implements RuleFinderExecutor {

    private int poolSize;

    @Override
    public void execute(){
        System.out.println("===================================");
    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }
}
