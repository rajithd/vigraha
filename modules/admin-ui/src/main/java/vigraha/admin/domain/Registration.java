package vigraha.admin.domain;

public class Registration {

    private String first_name;
    private String last_name;
    private String mobile_number;
    private String year_of_birth;
    private String profession;
    private String user_name;
    private String password;
    private String confirm_password;
    private String security_question;
    private String nic;
    private String address;
    private String country;
    private String province;
    private String city;

    public Registration()
    {}

    public Registration(String first_name , String last_name , String mobile_number , String year_of_birth ,
                        String profession , String user_name , String password , String confirm_password ,
                        String security_question , String nic , String address , String country , String province ,
                        String city)
    {
        this.first_name = first_name;
        this.last_name = last_name;
        this.mobile_number = mobile_number;
        this.year_of_birth = year_of_birth;
        this.profession = profession;
        this.user_name = user_name;
        this.password = password;
        this.confirm_password = confirm_password;
        this.security_question = security_question;
        this.nic = nic;
        this.address = address;
        this.country = country;
        this.province = province;
        this.city = city;
    }

    public String getFirst_name()
    {
        return first_name;
    }

    public String getLast_name()
    {
        return last_name;
    }

    public String getMobile_number()
    {
        return mobile_number;
    }

    public String getYear_of_birth()
    {
        return year_of_birth;
    }

    public String getProfession()
    {
        return profession;
    }

    public String getUser_name()
    {
        return user_name;
    }

    public String getPassword()
    {
        return password;
    }

    public String getConfirm_password()
    {
        return confirm_password;
    }

    public String getSecurity_question()
    {
        return security_question;
    }

    public String getNic()
    {
        return nic;
    }

    public String getAddress()
    {
        return address;
    }

    public String getCountry()
    {
        return country;
    }

    public String getProvince()
    {
        return province;
    }

    public String getCity()
    {
        return city;
    }

    public void setFirst_name(String first_name)
    {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name)
    {
        this.last_name = last_name;
    }

    public void setMobile_number(String mobile_number)
    {
        this.mobile_number = mobile_number;
    }

    public void setYear_of_birth(String year_of_birth)
    {
        this.year_of_birth = year_of_birth;
    }

    public void setProfession(String profession)
    {
        this.profession = profession;
    }

    public void setUser_name(String user_name)
    {
        this.user_name = user_name;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public void setConfirm_password(String confirm_password)
    {
        this.confirm_password = confirm_password;
    }

    public void setSecurity_question(String security_question)
    {
        this.security_question = security_question;
    }

    public void setNic(String nic)
    {
        this.nic = nic;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public void setCountry(String country)
    {
        this.country = country;
    }

    public void setProvince(String province)
    {
        this.province = province;
    }

    public void setCity(String city)
    {
        this.city = city;
    }
}
