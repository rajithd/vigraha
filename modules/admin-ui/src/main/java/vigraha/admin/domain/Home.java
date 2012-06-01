package vigraha.admin.domain;

import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;

public class Home {

    @NotEmpty
    @Size(min = 1, max = 50)
    private String username;
    @Size(min = 1, max = 20)
    private  String password;

    public Home()
    {}

    public Home(String username , String password)
    {
        this.username = username;
        this.password = password;
    }

    public String getUserName()
    {
        return username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setUserName(String username)
    {
       this.username = username;
    }

    public  void  setPassword(String password)
    {
        this.password = password;
    }
}
