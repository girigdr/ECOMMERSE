//
//package com.E_Comerse.Projects.IMAGES;
//
//
//import com.E_Comerse.Projects.PRODUCT_LIST.DataBases.DataBase;
//import com.E_Comerse.Projects.PRODUCT_LIST.Entity.Product;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.File;
//import java.io.IOException;
//import java.security.GeneralSecurityException;
//import java.util.*;
//
//@RestController
//@RequestMapping("/images")
//@CrossOrigin(origins = "*")
//public class Controller {
//
//    @Autowired
//    private Service service;
//
//    @Autowired
//    private DataBase db ;
//    @Autowired
//    ImageRepository imageRepository ;
//
//    @PostMapping("/upload/{id}")
//    public ResponseEntity<?> handleMultipleFileUpload(@RequestParam("images") List<MultipartFile> files,
//                                                      @PathVariable long id ) throws IOException, GeneralSecurityException {
//
//
//
//        System.out.println( "id"+ "    " + id );
//
//        if (files.isEmpty()) {
//            return ResponseEntity.badRequest().body("No files provided");
//        }
//
//        System.out.println( "id"+ "    " + id );
//
//        List<String> driveLinks = new ArrayList<>();
//
//        for (MultipartFile file : files) {
//            if (!file.isEmpty()) {
//                File tempFile = File.createTempFile("temp", null);
//                file.transferTo(tempFile);
//
//                // Upload to Google Drive and get the link
//                Res res = service.uploadImageToDrive(tempFile);
//                if (res != null && res.getUrl() != null) {
//                    driveLinks.add(res.getUrl());
//                    System.out.println(res.getUrl() );
//                }
//
//                tempFile.delete();
//            }
//        }
//        ImageData im = new ImageData( id , driveLinks ) ;
////        db.save( new Product( id , driveLinks ) ) ;
//        System.out.println(db.findById(id).toString());
//        db.findById(id).map(product -> {
//            product.setImageList( driveLinks ); // Update only std field
//            db.save(product);
//            return ResponseEntity.ok(product);
//        }).orElseGet(() -> ResponseEntity.notFound().build());
//
////        System.out.println(driveLinks );
//            return ResponseEntity.ok( imageRepository.save(im) ) ;
//    }
//
//
//
//    @GetMapping("/{id}/strings")
//    public ResponseEntity<List<String>> getStringList(@PathVariable Long id) {
//        return imageRepository.findById(id)
//                .map(imageData -> ResponseEntity.ok(imageData.getImageUrls())) // Ensure getTags() returns List<String>
//                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(Collections.emptyList()));
//    }
//
//
//
//}