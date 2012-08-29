package vigraha.dataloader.repository.impl;

public class DBBackupImpl {

    private String execCmd;
    private String username;
    private String password;
    private String database;
    private String backupPath;
    private String mysqlPath;

    public void callBackup() {

        execCmd = mysqlPath+" -u " + username + " -p" + password + " --add-drop-database -B " + database + " -r " + backupPath;
        Process runtimeProcess;

        try {

            System.out.println(execCmd);

            runtimeProcess = Runtime.getRuntime().exec(execCmd);
            int processComplete = runtimeProcess.waitFor();

            if (processComplete == 0) {
                System.out.println("Database backup has been made successfully");
            } else {
                System.out.println("Backup creation failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public void setBackupPath(String backupPath) {
        this.backupPath = backupPath;
    }

    public void setMysqlPath(String mysqlPath) {
        this.mysqlPath = mysqlPath;
    }
}
