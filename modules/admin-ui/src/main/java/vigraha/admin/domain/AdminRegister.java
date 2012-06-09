package vigraha.admin.domain;

public class AdminRegister {
    private String fullname;
    private String mobileno;
    private String id;
    private String username;
    private String password;

    public void setFullname(String fullname)
    {
        this.fullname = fullname;
    }

    public void setMobileno(String mobileno)
    {
        this.mobileno = mobileno;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getFullname()
    {
        return fullname;
    }

    public String getMobileno()
    {
        return mobileno;
    }

    public String getId()
    {
        return id;
    }

    public String getUsername()
    {
        return username;
    }

    public String getPassword()
    {
        return password;
    }
}
