package vigraha.admin.domain;

public class Company {
    private String company_name;
    private String reg_no;
    private String tele1;
    private String tele2;
    private String address;
    private String email;
    private String username;
    private String password;

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public void setReg_no(String reg_no) {
        this.reg_no = reg_no;
    }

    public void setTele1(String tele1) {
        this.tele1 = tele1;
    }

    public void setTele2(String tele2) {
        this.tele2 = tele2;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCompany_name() {
        return company_name;
    }

    public String getReg_no() {
        return reg_no;
    }

    public String getTele1() {
        return tele1;
    }

    public String getTele2() {
        return tele2;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
