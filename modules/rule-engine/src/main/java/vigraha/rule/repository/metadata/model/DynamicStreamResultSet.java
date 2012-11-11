package vigraha.rule.repository.metadata.model;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DynamicStreamResultSet {

    private ResultSet resultSet;
    private Connection connection;
    private Statement statement;

    public DynamicStreamResultSet(ResultSet resultSet, Connection connection, Statement statement) {
        this.resultSet = resultSet;
        this.connection = connection;
        this.statement = statement;
    }

    public ResultSet getResultSet() {
        return resultSet;
    }

    public void closeAll () throws SQLException {
        resultSet.close();
        statement.close();
        connection.close();
    }
}
