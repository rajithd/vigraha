package vigraha.dataloader.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.dataloader.repository.TransactionRepository;
import vigraha.dataloader.service.UploadManagerService;
import vigraha.dataloader.util.FileHandler;
import vigraha.dataloader.util.GPRSTransactionProcessorThread;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.CharBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class GPRSUploadManagerServiceImpl implements UploadManagerService {

    private static final Logger logger = LoggerFactory.getLogger(GPRSUploadManagerServiceImpl.class);
    private static final CharsetDecoder decoder = Charset.forName("ISO-8859-1").newDecoder();

    private String sourceDirectoryPath;
    private String archiveDirectoryPath;
    private String fileNamePattern;
    private String columnSeparator;
    private String rawBreaker;
    private int poolSize;

    private TransactionRepository transactionRepository;
    private FileHandler fileHandler;
    private Executor pool;

    public GPRSUploadManagerServiceImpl(int poolSize){
//        this.poolSize = poolSize;
//        pool = Executors.newFixedThreadPool(this.poolSize);
    }

    public void upload() {
        logger.info("GPRS CDR logs upload scheduler started");
        pool = Executors.newFixedThreadPool(poolSize);
        fileHandler = new FileHandler();
        String[] files = getFiles();
        logger.info("Total of [{}] GPRS logs found", files.length);
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
        logger.info("GPRS CDR logs upload scheduler completed");

    }

    private String[] getFiles() {
        return fileHandler.getMatchingFiles(sourceDirectoryPath, fileNamePattern);
    }

    private void readFile(String file) throws IOException {
        FileChannel channel = null;
        FileInputStream inFile = null;
        String fullPath = sourceDirectoryPath + file;
        try {
            logger.info("Reading the file [ {} ] started", file);
            StringBuilder builder = new StringBuilder();
            inFile = new FileInputStream(fullPath);
            channel = inFile.getChannel();
            MappedByteBuffer buffer = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
            CharBuffer charBuffer = decoder.decode(buffer);
            char character;
            while (charBuffer.hasRemaining()) {
                character = charBuffer.get();
                builder.append(character);
                if (character == rawBreaker.charAt(0)) {
                    pool.execute(new GPRSTransactionProcessorThread(builder.toString(),
                            columnSeparator, transactionRepository));
                    builder = new StringBuilder();
                }
            }
            logger.info("Reading the file [{}] completed", file);
        } finally {
            try {
                if (channel != null) {
                    channel.close();
                }
                if (inFile != null) {
                    inFile.close();
                }
            } catch (Exception ignored) {
            }
        }
    }

    private void archiveTheFile(String file) {
        logger.info("Archiving the file [{}]", file);
        fileHandler.moveDataFile(sourceDirectoryPath + file, archiveDirectoryPath);
    }


    public void setSourceDirectoryPath(String sourceDirectoryPath) {
        this.sourceDirectoryPath = sourceDirectoryPath;
    }

    public void setArchiveDirectoryPath(String archiveDirectoryPath) {
        this.archiveDirectoryPath = archiveDirectoryPath;
    }

    public void setFileNamePattern(String fileNamePattern) {
        this.fileNamePattern = fileNamePattern;
    }

    public void setColumnSeparator(String columnSeparator) {
        this.columnSeparator = columnSeparator;
    }

    public void setRawBreaker(String rawBreaker) {
        this.rawBreaker = rawBreaker;
    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }

    public void setTransactionRepository(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }
}
