package vigraha.rule.service.impl;

import vigraha.rule.service.RuleExecutor;

public class PromotionRuleExecutorImpl implements RuleExecutor {
    
    private int poolSize;

    @Override
    public void execute() {
        System.out.println("rule executor");

    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }
}
