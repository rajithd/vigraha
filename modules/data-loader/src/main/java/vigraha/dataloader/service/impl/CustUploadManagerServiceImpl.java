package vigraha.dataloader.service.impl;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.dataloader.repository.CustTranactionRepository;
import vigraha.dataloader.service.UploadManagerService;
import vigraha.dataloader.util.CustomerInfo;
import vigraha.dataloader.util.FileHandler;

import java.io.*;

public class CustUploadManagerServiceImpl implements UploadManagerService {

    private static final Logger logger = LoggerFactory.getLogger(CustUploadManagerServiceImpl.class);

    private String sourceDirectoryPath;
    private String fileNamePattern;

    private FileHandler fileHandler;

    private CustTranactionRepository transactionRepository;

    @Override
    public void upload() {
        logger.info("Customer info upload scheduler started");
        fileHandler = new FileHandler();
        String[] files = getFiles();
        logger.info("Total of [{}] customer logs found", files.length);
        for (String file : files) {
            try {
                logger.info("Started to process [{}] file", file);
                readFile(file);
                logger.info("Successfully inserted the records to database in the file [{}]", file);
            } catch (Exception e) {
                logger.error("Unexpected error while reading the file [" + file + "]", e);
            }
        }
    }

    private void readFile(String file) throws IOException {
        String fullPath = sourceDirectoryPath + file; //full path / todo need to get from property

        try {
            logger.info("Reading the file [ {} ] started", file);
            BufferedReader br = new BufferedReader(new FileReader(fullPath));
            logger.info("Reading the file [{}] completed", file);

            Gson gson = new GsonBuilder().create();
            CustomerInfo[] ci = gson.fromJson(br, CustomerInfo[].class);
            transactionRepository.save(ci);

            new FileHandler().clearFile(fullPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
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

    public void setTransactionRepository(CustTranactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }
}
