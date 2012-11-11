package vigraha.rule.repository.metadata.spring;


import liquibase.Liquibase;
import liquibase.exception.DatabaseException;
import liquibase.exception.LiquibaseException;

import java.sql.Connection;
import java.sql.SQLException;

public class SpringLiquibase extends liquibase.integration.spring.SpringLiquibase {

    private boolean executeEnabled = false;

    public void afterPropertiesSet() throws LiquibaseException {

        if (! executeEnabled) {
            return;
        }

        Connection c = null;
        Liquibase liquibase = null;
        try {
            c = getDataSource().getConnection();
            liquibase = createLiquibase(c);
            liquibase.update(getContexts());
        } catch (SQLException e) {
            throw new DatabaseException(e);
        } finally {
            if (c != null) {
                try {
                    c.rollback();
                    c.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    public void setExecuteEnabled(boolean executeEnabled) {
        this.executeEnabled = executeEnabled;
    }
}
