package vigraha.rule.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:rule-engine-context-test.xml"})
public class HiveTableImportingExecutorTest {

    @Autowired
    private HiveTableImportingExecutor hiveTableImportingExecutor;

    @Test
    public void testExecute() throws Exception {
        hiveTableImportingExecutor.execute();
    }
}
