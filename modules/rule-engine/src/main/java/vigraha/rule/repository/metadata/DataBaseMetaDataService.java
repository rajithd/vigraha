package vigraha.rule.repository.metadata;

import vigraha.rule.repository.metadata.model.Column;
import vigraha.rule.repository.metadata.model.Table;

import java.util.List;


public interface DataBaseMetaDataService {

    List<Table> getAllTablesInDatabase();

    List<Column> getColumns(String tableName);

    List<Column> getColumns(Table table);

    Column getColumnInTable(String tableName, String columnName);

    Table getTable(String tableName);

}
