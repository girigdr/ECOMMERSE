package com.E_Comerse.Projects.CART_1;

import com.E_Comerse.Projects.PRODUCT_LIST.Entity.Product;
import jakarta.persistence.*;

import java.util.List;

@Entity
public class CartData {

    @Id
    private String user;

    @ManyToMany
    @JoinTable(
            name = "cart_products",
            joinColumns = @JoinColumn(name = "cart_user"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private List<Product> products;

    public CartData() {}

    public CartData(String user, List<Product> products) {
        this.user = user;
        this.products = products;
    }

    // Getters and setters
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}