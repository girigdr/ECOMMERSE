package com.E_Comerse.Projects.Login_Costomer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository db;

    public CustomerData checkAndSendData(String userName) {
        return db.findById(userName)
                .orElse(new CustomerData("", "", ""));  // Avoids returning null
    }

    public CustomerData Sign_in_for_consumer(CustomerData cd) {
        return db.save( cd ) ;
    }
}