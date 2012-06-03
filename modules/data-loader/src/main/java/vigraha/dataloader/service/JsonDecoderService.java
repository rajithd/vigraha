package vigraha.dataloader.service;


import vigraha.dataloader.domain.Customer;

import java.util.Map;

public interface JsonDecoderService {

    public Customer decodeCustomer(String record, String separator, int customerJsonIndex);

}
