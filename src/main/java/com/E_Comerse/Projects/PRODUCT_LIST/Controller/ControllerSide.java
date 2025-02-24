package com.E_Comerse.Projects.PRODUCT_LIST.Controller;
import com.E_Comerse.Projects.PRODUCT_LIST.Entity.Product;
import com.E_Comerse.Projects.PRODUCT_LIST.Service.ServiceSide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/PRODUCT")
@Component
public class ControllerSide {

    @Autowired
    private ServiceSide service ;

    @GetMapping("/addAllDataToFrontEnd")
    public ResponseEntity< List<Product> > getAllData () {
        System.out.println("abcdefghijklmnopqrstuvwxyz");
        return ResponseEntity.ok(service.getAllData() );
    }


    @PostMapping("/addDataInDataBase")
    public ResponseEntity<Product> addProduct(@RequestBody Product product ) {
        System.out.println("abcdefghijklmnopqrstuvwxyz");
        Product savedProduct = service.addProduct(product);
        System.out.println( savedProduct );

        return ResponseEntity.ok(savedProduct) ;
    }








}
