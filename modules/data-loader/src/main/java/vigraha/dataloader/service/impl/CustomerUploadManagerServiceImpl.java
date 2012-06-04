package vigraha.dataloader.service.impl;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.dataloader.domain.Customer;
import vigraha.dataloader.repository.TransactionRepository;
import vigraha.dataloader.service.JsonDecoderService;
import vigraha.dataloader.service.UploadManagerService;
import vigraha.dataloader.util.FileHandler;

import java.io.*;
import java.sql.SQLException;
import java.util.Map;

public class CustomerUploadManagerServiceImpl implements UploadManagerService {

    private static final Logger logger = LoggerFactory.getLogger(CustomerUploadManagerServiceImpl.class);

    private String sourceDirectoryPath;
    private String fileNamePattern;
    private String archiveDirectoryPath;
    private String columnSeparator;
    private int jsonIndex;
    private String columnAppender;
    private String rowBreaker;
    private String record;

    private FileHandler fileHandler;
    private JsonDecoderService jsonDecoderService;
    private TransactionRepository transactionRepository;

    @Override
    public void upload() {
        logger.info("Customer info upload scheduler started");
        fileHandler = new FileHandler();
        String[] files = getFiles();
        logger.info("Total of [{}] customer logs found", files.length);
        String fullPath;
        for (String file : files) {
            try {
                logger.info("Started to process [{}] file", file);
                readFile(file);
                logger.info("Successfully inserted the records to database in the file [{}]", file);
                archiveTheFile(file);
            } catch (Exception e) {
                logger.error("Unexpected error while reading the file [" + file + "]", e);
            }
        }
    }

    private void archiveTheFile(String file) {
        logger.info("Archiving the file [{}]", file);
        fileHandler.moveDataFile(sourceDirectoryPath + file, archiveDirectoryPath);
    }

    private void readFile(String file) throws SQLException, IOException {
        String fullPath = sourceDirectoryPath + file;
        String fileContent = fileHandler.getDataOfFile(fullPath);
        String[] rows = new String[0];
        if (fileContent != null) {
            rows = fileContent.split(rowBreaker);
            for (String row : rows) {
                Customer customer = jsonDecoderService.decodeCustomer(row, columnSeparator, jsonIndex);
                appendCustomerToRecord(customer, row);
                transactionRepository.save(record, columnSeparator);
            }
        }
    }

    private void appendCustomerToRecord(Customer customer, String row) {
        this.record = record;
        appendStringToRecord(customer.getId());
        appendStringToRecord(customer.getMsisdn());
        appendStringToRecord(customer.getName());
        appendStringToRecord(customer.getCity());
    }

    private void appendStringToRecord(String value) {
        record = record + columnAppender + value;
    }

    private String[] getFiles() {
        return fileHandler.getMatchingFiles(sourceDirectoryPath, fileNamePattern);
    }

    public void setSourceDirectoryPath(String sourceDirectoryPath) {
        this.sourceDirectoryPath = sourceDirectoryPath;
    }

    public void setFileNamePattern(String fileNamePattern) {
        this.fileNamePattern = fileNamePattern;
    }

    public void setArchiveDirectoryPath(String archiveDirectoryPath) {
        this.archiveDirectoryPath = archiveDirectoryPath;
    }

    public void setColumnSeparator(String columnSeparator) {
        this.columnSeparator = columnSeparator;
    }

    public void setJsonIndex(int jsonIndex) {
        this.jsonIndex = jsonIndex;
    }

    public void setColumnAppender(String columnAppender) {
        this.columnAppender = columnAppender;
    }

    public void setJsonDecoderService(JsonDecoderService jsonDecoderService) {
        this.jsonDecoderService = jsonDecoderService;
    }

    public void setTransactionRepository(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    public void setRowBreaker(String rowBreaker) {
        this.rowBreaker = rowBreaker;
    }
}
