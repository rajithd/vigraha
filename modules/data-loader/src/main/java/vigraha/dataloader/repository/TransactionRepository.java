package vigraha.dataloader.repository;


import java.sql.SQLException;

public interface TransactionRepository {
    
    public void save(String record, String columnSeparator) throws SQLException;
}
