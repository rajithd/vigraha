package vigraha.dataloader.util;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.dataloader.repository.TransactionRepository;

public class USSDTransactionProcessorThread implements Runnable {

    private static final String NEWLINE_CHARACTER = "\n";

    private String record;
    private String columnSeparator;
    private TransactionRepository transactionRepository;

    private static final Logger logger = LoggerFactory.getLogger(USSDTransactionProcessorThread.class);

    public USSDTransactionProcessorThread(String record, String columnSeparator, TransactionRepository transactionRepository) {

        if (record.endsWith(NEWLINE_CHARACTER)) {
            record = record.substring(0, record.length() - 1);
        }
        this.record = record;
        this.columnSeparator = columnSeparator;
        this.transactionRepository = transactionRepository;

    }

    public void run() {
        try {
            transactionRepository.save(record, columnSeparator);
        } catch (Exception e) {
            //todo: Send SNMP trap
            logger.error("Couldn't save the record ["+record+"] Unexpected exception thrown while saving the record",e);
        }
    }
}
