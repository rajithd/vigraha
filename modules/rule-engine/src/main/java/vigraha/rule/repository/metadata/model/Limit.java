package vigraha.rule.repository.metadata.model;

public class Limit {

    long offset;
    int size;

    public Limit(long offset, int size) {
        this.offset = offset;
        this.size = size;
    }

    public Limit(int size) {
        this.size = size;
        this.offset = -1;
    }

    @Override
    public String toString() {
        StringBuilder limitStmt = new StringBuilder("limit ");

        if (offset >= 0) {
            limitStmt.append(offset).append(",");
        }
        limitStmt.append(size);
        return limitStmt.toString();
    }
}
