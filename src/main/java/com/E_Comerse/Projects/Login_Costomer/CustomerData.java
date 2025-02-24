package com.E_Comerse.Projects.Login_Costomer;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class CustomerData {
    @Id
    private String userName;
    private String password;
    private String name;

    public CustomerData(String userName, String password, String name) {
        this.userName = userName;
        this.password = password ;
        this.name = name ;
    }

    public CustomerData() {
        this.userName = "";
        this.name = "";
        this.password = "";
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
}
