package vigraha.dataloader.service.impl;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vigraha.dataloader.domain.Customer;
import vigraha.dataloader.service.JsonDecoderService;

import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JsonDecoderServiceImpl implements JsonDecoderService{

    private static final Logger logger = LoggerFactory.getLogger(JsonDecoderServiceImpl.class);
    private static Type typeCustomer = new TypeToken<List<Customer>>() {}.getType();
    private static Gson gson = new Gson();

    @Override
    public Customer decodeCustomer(String record, String separator, int customerJsonIndex) {
        String jsonString = getJsonString(record, separator, customerJsonIndex);
        logger.debug("Getting customer json object [{}]", jsonString );
        System.out.println(">>>>>>>" + jsonString);
        Customer customer = gson.fromJson(jsonString,Customer.class);
        Map<String, Customer> customerMap = new HashMap<String, Customer>();
//        for(Customer customer:customerList){
//            customerMap.put("customer",customer);
//        }
        return customer;
    }

    private String getJsonString(String record, String separator, int customerJsonIndex) {
        String[] arrString = record.split(separator,-1);
        return arrString[customerJsonIndex-1];
    }
}
