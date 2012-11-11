package vigraha.rule.service;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:rule-engine-context-test.xml"})
public class WinnerSelectionProcessTest {

    @Autowired
    private WinnerSelectionProcess winnerSelectionProcess;

    @Test
    public void testConnection(){
        String sql = "select count(*) from voice_call";
        winnerSelectionProcess.executeSQL(sql);

    }
}
