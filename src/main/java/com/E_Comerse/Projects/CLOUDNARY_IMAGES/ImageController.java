package com.E_Comerse.Projects.CLOUDNARY_IMAGES;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.E_Comerse.Projects.PRODUCT_LIST.DataBases.DataBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;


@RestController
@RequestMapping("/images")
@CrossOrigin(origins = "*")
public class ImageController {
    @Autowired
    DataBase db;
    @Autowired
    CloudinaryService cloudinaryService;

    @PostMapping("/upload/{id}")
    public ResponseEntity<?> handleMultipleFileUpload(@RequestParam("images") List<MultipartFile> files, @PathVariable long id) throws IOException {
        try {
            List<String> imageUrls = cloudinaryService.uploadImages(files);
            db.findById(id).ifPresent(product -> {
                product.setImageList(imageUrls);
                db.save(product);
            });

            return ResponseEntity.ok("IMAGE ADDED SUCESSFULL");

        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }


}

