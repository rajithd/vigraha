package vigraha.rule.repository.metadata.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rajith
 * Date: 11/11/12
 * Time: 11:13 AM
 * To change this template use File | Settings | File Templates.
 */
public class Table {

    private String name;
    private String remarks;
    private String schema;
    private String tableSpace;
    private List<Column> columns = new ArrayList<Column>();
    private boolean cascaseConstraints;
    private List<ColumnConfig> columnConfigList = new ArrayList<ColumnConfig>();

    public Table(String name, String remarks, String schema) {
        this.name = name;
        this.remarks = remarks;
        this.schema = schema;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public String getTableSpace() {
        return tableSpace;
    }

    public void setTableSpace(String tableSpace) {
        this.tableSpace = tableSpace;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void setColumns(List<Column> columns) {
        this.columns = columns;
    }

    public boolean isCascaseConstraints() {
        return cascaseConstraints;
    }

    public void setCascaseConstraints(boolean cascaseConstraints) {
        this.cascaseConstraints = cascaseConstraints;
    }

    public List<ColumnConfig> getColumnConfigList() {
        return columnConfigList;
    }

    public void setColumnConfigList(List<ColumnConfig> columnConfigList) {
        this.columnConfigList = columnConfigList;
    }
}
