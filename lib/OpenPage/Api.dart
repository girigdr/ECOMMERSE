
import 'package:flutter/material.dart' ;
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:8080/PRODUCT/addAllDataToFrontEnd";

  // Fetch the product list
  static Future< List<Product> > fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }




   static Future<void> addProduct( Product prod ) async {
    final url = Uri.parse("http://localhost:8080/PRODUCT/addDataInDataBase"); // Replace with your actual backend URL

    Product newProduct = prod ;
    // Product(
    //   id: 1,
    //   name: "Smartphone",
    //   rating: 4.5,
    //   price: 299.99,
    //   description: "Latest 5G smartphone with AMOLED display",
    //   brandName: "Samsung",
    //   warranty: "1 Year",
    //   deliveryCharges: 10.0,
    //   imageList : []
    // );

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(newProduct.toJson()),
      );

      if (response.statusCode == 200) {
        print("Product added successfully: ${response.body}");
      } else {
        print("Failed to add product: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }




}


//geting the data of PRODUCTS


class Product {
  final int id;
  final String name;
  final double rating;
  final double price;
  final String description;
  final String brandName;
  final String warranty;
  final double deliveryCharges;
  final List < dynamic > imageList;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
    required this.brandName,
    required this.warranty,
    required this.deliveryCharges,
    required this.imageList ,

  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0, // Default to 0 if null
      name: json['name'] ?? 'No Name', // Default to 'No Name'
      rating: (json['rating'] ?? 0).toDouble(), // Default to 0.0
      price: (json['price'] ?? 0).toDouble(), // Default to 0.0
      description: json['description'] ?? 'No Description', // Default to empty stringrating: (json['rating'] ?? 0).toDouble(), // Default to 0.0
      brandName: json['brandName'] ?? 'no Brand', // Default to 0.0
      warranty: json['warranty'] ?? " No Warranty" ,
      deliveryCharges: ( json['deliveryCharges'] ?? 0 ).toDouble(),
      imageList:  ( json['imageList'] ?? [] ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "rating": rating,
      "price": price,
      "description": description,
      "brandName": brandName,
      "warranty": warranty,
      "deliveryCharges": deliveryCharges,
      "imageList": [],
    };
  }
}
