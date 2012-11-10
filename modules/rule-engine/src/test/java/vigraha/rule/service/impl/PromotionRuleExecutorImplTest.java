package vigraha.rule.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import vigraha.rule.repository.impl.PromotionRuleExecutorRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:rule-engine-context-test.xml"})
public class PromotionRuleExecutorImplTest {

    @Autowired
    private PromotionRuleExecutorImpl promotionRuleExecutor;

    @Test
    public void testExecute() throws Exception {
        promotionRuleExecutor.execute();
    }
}
