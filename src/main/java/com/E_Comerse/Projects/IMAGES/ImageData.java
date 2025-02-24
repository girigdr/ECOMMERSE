//
//package com.E_Comerse.Projects.IMAGES;
//
//import jakarta.persistence.*;
//import java.util.List;
//
//@Entity
//public class ImageData {
//
//    @Id
//    private Long id;
//
//    @ElementCollection
//    private List<String> imageUrls;
//
//    public ImageData(Long id, List<String> imageUrls) {
//        this.id = id;
//        this.imageUrls = imageUrls;
//    }
//
//    public ImageData() {
//    }
//
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    public List<String> getImageUrls() {
//        return imageUrls;
//    }
//
//    public void setImageUrls(List<String> imageUrls) {
//        this.imageUrls = imageUrls;
//    }
//
//    @Override
//    public String toString() {
//        return "ImageData{" +
//                "id=" + id +
//                ", imageUrls=" + imageUrls +
//                '}';
//    }
//}
