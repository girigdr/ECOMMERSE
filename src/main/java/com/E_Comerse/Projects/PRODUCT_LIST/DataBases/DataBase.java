package com.E_Comerse.Projects.PRODUCT_LIST.DataBases;

import com.E_Comerse.Projects.PRODUCT_LIST.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataBase extends JpaRepository <Product, Long > {

}
