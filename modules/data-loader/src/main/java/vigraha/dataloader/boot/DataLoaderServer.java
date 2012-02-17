package vigraha.dataloader.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;

public class DataLoaderServer {

    private final static Logger logger = LoggerFactory.getLogger(DataLoaderServer.class);

    public static void main(String[] args) throws IOException {
        ApplicationContext context = new ClassPathXmlApplicationContext("data-loader-context.xml");
        logger.info("################################################");
        logger.info("##  Vigraha Data Loader Started Successfully  ##");
        logger.info("################################################");
    }
}
