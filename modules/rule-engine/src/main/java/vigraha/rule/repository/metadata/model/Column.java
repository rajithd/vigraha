package vigraha.rule.repository.metadata.model;


public class Column implements Comparable<Column> {

    private Table table;
    private String name;
    private int dataType;
    private int columnSize;
    private int decimalDigits;
    private Boolean nullable;
    private String typeName;
    private Object defaultValue;
    private boolean autoIncrement = false;
    private boolean primaryKey = false;
    private boolean unique = false;
    private boolean certainDataType = true;
    private String remarks;

    public Column(String columnName,
                  int dataType,
                  int columnSize,
                  int decimalDigits,
                  boolean nullable,
                  String typeName,
                  Object defaultValue,
                  boolean autoIncrement,
                  boolean primaryKey,
                  boolean unique,
                  boolean certainDataType,
                  String remarks) {

        this.name = columnName;
        this.dataType = dataType;
        this.columnSize = columnSize;
        this.decimalDigits = decimalDigits;
        this.nullable = nullable;
        this.typeName = typeName;
        this.defaultValue = defaultValue;
        this.autoIncrement = autoIncrement;
        this.primaryKey = primaryKey;
        this.unique = unique;
        this.certainDataType = certainDataType;
        this.remarks = remarks;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDataType() {
        return dataType;
    }

    public void setDataType(int dataType) {
        this.dataType = dataType;
    }

    public int getColumnSize() {
        return columnSize;
    }

    public void setColumnSize(int columnSize) {
        this.columnSize = columnSize;
    }

    public int getDecimalDigits() {
        return decimalDigits;
    }

    public void setDecimalDigits(int decimalDigits) {
        this.decimalDigits = decimalDigits;
    }

    public Boolean getNullable() {
        return nullable;
    }

    public void setNullable(Boolean nullable) {
        this.nullable = nullable;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Object getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(Object defaultValue) {
        this.defaultValue = defaultValue;
    }

    public boolean isAutoIncrement() {
        return autoIncrement;
    }

    public void setAutoIncrement(boolean autoIncrement) {
        this.autoIncrement = autoIncrement;
    }

    public boolean isPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(boolean primaryKey) {
        this.primaryKey = primaryKey;
    }

    public boolean isUnique() {
        return unique;
    }

    public void setUnique(boolean unique) {
        this.unique = unique;
    }

    public boolean isCertainDataType() {
        return certainDataType;
    }

    public void setCertainDataType(boolean certainDataType) {
        this.certainDataType = certainDataType;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public int compareTo(Column o) {
        return name.compareTo(o.getName());
    }
}
