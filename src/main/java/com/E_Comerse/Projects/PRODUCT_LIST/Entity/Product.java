package com.E_Comerse.Projects.PRODUCT_LIST.Entity;


import jakarta.persistence.*;

import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "shopping_app")
public class Product {

    @Id
    private long id;

    private String name;
    private double rating;
    private double price;
    private String description;
    private String brandName;
    private String warranty;
    private double deliveryCharges;


    @ElementCollection
    List < String > imageList ;

    public Product(long id, List<String> imageList) {
        this.id = id;
        this.imageList = imageList;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }

    public Product() {
    }


    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", rating=" + rating +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", brandName='" + brandName + '\'' +
                ", warranty='" + warranty + '\'' +
                ", deliveryCharges=" + deliveryCharges +
                '}';
    }

    public Product(long id, String name, double rating, double price, String description, String brandName, String warranty, double deliveryCharges, List<String> imageList) {
        this.id = id;
        this.name = name;
        this.rating = rating;
        this.price = price;
        this.description = description;
        this.brandName = brandName;
        this.warranty = warranty;
        this.deliveryCharges = deliveryCharges;
        this.imageList = imageList;
    }

    public Product(long id, String name, double rating, double price, String description, String brandName, String warranty, double deliveryCharges) {
        this.id = id;
        this.name = name;
        this.rating = rating;
        this.price = price;
        this.description = description;
        this.brandName = brandName;
        this.warranty = warranty;
        this.deliveryCharges = deliveryCharges;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    public double getDeliveryCharges() {
        return deliveryCharges;
    }

    public void setDeliveryCharges(double deliveryCharges) {
        this.deliveryCharges = deliveryCharges;
    }

}
