package vigraha.admin.domain;

public class Register {
    private String firstname;
    private String lastname;
    private String mobilenumber;
    private String yearofbirth;
    private String profession;
    private String username;
    private String password;
    private String securityquestion;
    private String nic;
    private String address;
    private String country;
    private String province;
    private String city;

    public void setFirst_name(String first_name) {
        this.firstname = first_name;
    }

    public void setLast_name(String last_name) {
        this.lastname = last_name;
    }

    public void setMobile_number(String mobile_number) {
        this.mobilenumber = mobile_number;
    }

    public void setYear_of_birth(String year_of_birth) {
        this.yearofbirth = year_of_birth;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public void setUser_name(String user_name) {
        this.username = user_name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setSecurity_question(String security_question) {
        this.securityquestion = security_question;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getFirst_name() {
        return firstname;
    }

    public String getLast_name() {
        return lastname;
    }

    public String getMobile_number() {
        return mobilenumber;
    }

    public String getYear_of_birth() {
        return yearofbirth;
    }

    public String getProfession() {
        return profession;
    }

    public String getUser_name() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getSecurity_question() {
        return securityquestion;
    }

    public String getNic() {
        return nic;
    }

    public String getAddress() {
        return address;
    }

    public String getCountry() {
        return country;
    }

    public String getProvince() {
        return province;
    }

    public String getCity() {
        return city;
    }
}
