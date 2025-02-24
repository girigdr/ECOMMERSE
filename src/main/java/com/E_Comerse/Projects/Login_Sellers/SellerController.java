package com.E_Comerse.Projects.Login_Sellers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin( origins = "*")
public class SellerController {


    @Autowired
    private SellerService service;

    @PostMapping("/sign_inForSellers/addDataForSellers/")
    public ResponseEntity<?> Sign_in_for_consumer(@RequestBody SellersData cd ) {
        SellersData customerData = service.checkAndSendData(cd.getUserName());
        if ( ! customerData.getUserName().isEmpty()  ) {
            return ResponseEntity.status(457).body("User already Exist");
        }
        return ResponseEntity.ok(service.Sign_in_for_consumer( cd )) ;
    }

    @GetMapping("/loginForSellers/sendDataForSellers/{user}/{pw}")
    public ResponseEntity<?> checkAndSendData(@PathVariable String user, @PathVariable String pw) {
        System.out.println("ppppppppppppppppppppppppppppppppppppp");
        SellersData cd = service.checkAndSendData(user);
//        System.out.println( "=------------------> " +cd.getUserName() );
//        System.out.println( "=------------------> " +cd.getUserName().isEmpty() );
        if ( cd.getUserName().isEmpty()  ) {
//            System.out.println("=--------------------------=");
            return ResponseEntity.status(455).body("User Not Found");
        }
        else if (cd.getPassword().equals(pw)) {
            return ResponseEntity.ok(cd);
        }
        else {
            return ResponseEntity.status(456).body("Incorrect Password");
        }
    }
}
