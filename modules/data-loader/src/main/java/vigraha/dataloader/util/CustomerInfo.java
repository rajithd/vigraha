package vigraha.dataloader.util;

public class CustomerInfo {

    public String id = "";
    public String msisdn = "";
    public String name = "";
    public String city = "";

    public CustomerInfo() {

    }

    public String getAll(){
        return "'"+id+"','"+msisdn+"','"+name+"','"+city+"'";
    }
}
