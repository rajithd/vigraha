package vigraha.rule.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class RuleEngineServer {

    private static final Logger logger = LoggerFactory.getLogger(RuleEngineServer.class);

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("rule-engine-context.xml");
        System.out.println("RRRRRRRRRRRRRRRRR                     lllllll                     \n" +
                "R::::::::::::::::R                    l:::::l                     \n" +
                "R::::::RRRRRR:::::R                   l:::::l                     \n" +
                "RR:::::R     R:::::R                  l:::::l                     \n" +
                "  R::::R     R:::::Ruuuuuu    uuuuuu   l::::l     eeeeeeeeeeee    \n" +
                "  R::::R     R:::::Ru::::u    u::::u   l::::l   ee::::::::::::ee  \n" +
                "  R::::RRRRRR:::::R u::::u    u::::u   l::::l  e::::::eeeee:::::ee\n" +
                "  R:::::::::::::RR  u::::u    u::::u   l::::l e::::::e     e:::::e\n" +
                "  R::::RRRRRR:::::R u::::u    u::::u   l::::l e:::::::eeeee::::::e\n" +
                "  R::::R     R:::::Ru::::u    u::::u   l::::l e:::::::::::::::::e \n" +
                "  R::::R     R:::::Ru::::u    u::::u   l::::l e::::::eeeeeeeeeee  \n" +
                "  R::::R     R:::::Ru:::::uuuu:::::u   l::::l e:::::::e           \n" +
                "RR:::::R     R:::::Ru:::::::::::::::uul::::::le::::::::e          \n" +
                "R::::::R     R:::::R u:::::::::::::::ul::::::l e::::::::eeeeeeee  \n" +
                "R::::::R     R:::::R  uu::::::::uu:::ul::::::l  ee:::::::::::::e  \n" +
                "RRRRRRRR     RRRRRRR    uuuuuuuu  uuuullllllll    eeeeeeeeeeeeee  ");
        System.out.println("Started Successfully");
    }
}
