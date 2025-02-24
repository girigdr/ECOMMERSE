package com.E_Comerse.Projects.Login_Sellers;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class SellersData {
    @Id
    private String userName;
    private String password;
    private String name;
    private String brand;

    public SellersData(String userName, String password, String name , String brand ) {
        this.userName = userName;
        this.password = password ;
        this.name = name ;
        this.brand = brand ;
    }

    public SellersData() {
        this.userName = "";
        this.name = "";
        this.password = "";
        this.brand = "";
    }

    @Override
    public String toString() {
        return "CustomerData{" +
                "userName='" + userName + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public String getPassword() {
        return password != null ? password : "";
    }
    public String getUserName() {
        return userName != null ? userName : "";
    }

    public void setUserName(String userName) { this.userName = userName; }

    public void setPassword(String password) { this.password = password; }

    public String getName() { return name != null ? name : ""; }
    public void setName(String name) { this.name = name; }

    public String getBrand() { return brand != null ? brand : ""; }
    public void setBrand(String brand) { this.brand = brand; }
}
