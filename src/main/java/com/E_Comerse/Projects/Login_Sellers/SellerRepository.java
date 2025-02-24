package com.E_Comerse.Projects.Login_Sellers;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface SellerRepository extends JpaRepository< SellersData , String > {

}
