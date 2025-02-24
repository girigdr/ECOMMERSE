package com.E_Comerse.Projects.CART_1;


import com.E_Comerse.Projects.PRODUCT_LIST.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<CartData, String> {
    @Query("SELECT p FROM CartData c JOIN c.products p WHERE c.user = :user")
    List<Product> findProductsByUser(@Param("user") String user);
}