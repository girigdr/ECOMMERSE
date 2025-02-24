package com.E_Comerse.Projects.Login_Sellers;

import com.E_Comerse.Projects.Login_Costomer.CustomerData;
import com.E_Comerse.Projects.Login_Costomer.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerService {


    @Autowired
    private SellerRepository db;

    public SellersData checkAndSendData(String userName) {
        return db.findById(userName)
                .orElse(new SellersData("", "", "" , ""));  // Avoids returning null
    }

    public SellersData Sign_in_for_consumer(SellersData cd) {
        return db.save( cd ) ;
    }
}
