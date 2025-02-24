import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../page1.dart';


class Cart {
  final int id;
  final String name;
  final double rating;
  final double price;
  final String description;
  final String brandName;
  final String warranty;
  final double deliveryCharges;
  final List < dynamic > imageList;

  Cart({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
    required this.brandName,
    required this.warranty,
    required this.deliveryCharges,
    required this.imageList,

  });


  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
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
      "imageList": imageList ,
    };
  }
}



class CartApi {



  

  static const String baseUrl = "http://localhost:8080/cart";


  static Future<List<Cart>> getAllProductsByUserId(String user) async {
    // Adjust the URL based on your backend endpoint.
    final url = Uri.parse("$baseUrl/getAllProducts/$user");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode the JSON array.
        final List<dynamic> jsonData = json.decode(response.body);
        // Map each JSON item to a Product object.
        return jsonData.map((item) => Cart.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load products: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching products: $error");
    }
  }






  static Future<void> addProductToCart(
      BuildContext context, String user, int productId) async {
    // Construct the URL with query parameters.
    final url = Uri.parse("$baseUrl/add?user=$user&productId=$productId");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        // The backend returns a success message.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Product added to cart successfully."),
            behavior: SnackBarBehavior.floating,
          ),
        );
        print("Add response: ${response.body}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("ALREADY IN THE CART OR ERROR HAPPENED"),
            behavior: SnackBarBehavior.floating,
          ),
        );
        print("Failed to add product. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error adding product to cart: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Error adding product: $error"),
            behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }



  /// Deletes a product from the user's cart.
  /// [user] is the username and [productId] is the id of the product to remove.
  static Future<void> deleteProductFromCart(
      BuildContext context, String user, int productId) async {
    // Construct the URL.
    final url = Uri.parse("$baseUrl/delete/$user/$productId");

    try {
      final response = await http.delete(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        // The backend returns a success message.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Product removed from cart successfully."),
            behavior: SnackBarBehavior.floating,
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => page1( user : user) ),
          (Route<dynamic> route) => false,
        );

        print("Delete response: ${response.body}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content:Text("Failed to remove product. Error: ${response.statusCode}"),
          ),
        );
        print("Failed to remove product. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error removing product from cart: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          content: Text("Error removing product: $error"),
        ),
      );
    }
  }
}




// import 'dart:convert';
// import 'package:untitled/OpenPage/page1.dart';

// import '/OpenPage/Api.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'Cart.dart';

// class CartApi {



//   static Future<void> deleteProductFromCart(BuildContext context, int productId) async {
//   final url = Uri.parse("http://192.168.181.144:8080/cart/deleteFromCart/$productId");
  
//   try {
//     final response = await http.delete(
//       url,
//       headers: {"Content-Type": "application/json"},
//     );

//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: const Color.fromARGB(255, 187, 114, 72),
//           content: Text(
//             "PRODUCT REMOVED FROM CART",
//             style: TextStyle(color: Colors.white),
//           ),
//           behavior: SnackBarBehavior.floating,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       );

//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => page1() ),
//         (Route<dynamic> route) => false,
//       );
//       print("Product removed successfully: ${response.body}");
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Failed to remove product: ${response.statusCode}"),
//         ),
//       );
//       print("Failed to remove product: ${response.statusCode}");
//     }
//   } catch (error) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Error: $error"),
//       ),
//     );
//     print("Error: $error");
//   }
// }


//   static const String baseUrl = "http://192.168.181.144:8080/cart/getAllDataFFromCart";


//   // Fetch the cart list
//   static Future< List< Cart > > getCartProduct() async {
//     final response = await http.get(Uri.parse(baseUrl));

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonData = json.decode(response.body);
//       return jsonData.map((item) => Cart.fromJson(item)).toList();
//     } else {
//       throw Exception("Failed to load products");
//     }
//   }


  
//    static Future<void> addProducttoCart( BuildContext context , Product prod ) async {
//     final url = Uri.parse("http://192.168.181.144:8080/cart/addDataInCart_DataBase"); // Replace with your actual backend URL

//     Cart newProduct = Cart(id: prod.id, name: prod.name, rating: prod.rating,
//      price: prod.price, description: prod.description, brandName: prod.brandName, warranty: prod.warranty, deliveryCharges: prod.deliveryCharges, imageList: prod.imageList) ;

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(newProduct.toJson()),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger
//         .of(context)
//         .showSnackBar(
//           SnackBar(
//             backgroundColor: const Color.fromARGB(255, 187, 114, 72) ,
            
//             content: Text("PRODUCT ADDED TO CART" , style: TextStyle( color: const Color.fromARGB(255, 255, 255, 255) ),) ,
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),  
//           )
//         );
//         print("Product added successfully: ${response.body}");
//       } else {
//         print("Failed to add product: ${response.statusCode}");
//       }
//     } catch (error) {
//       print("Error: $error");
//     }
//   }
// }


// //geting the data of PRODUCTS


// class Cart {
//   final int id;
//   final String name;
//   final double rating;
//   final double price;
//   final String description;
//   final String brandName;
//   final String warranty;
//   final double deliveryCharges;
//   final List < dynamic > imageList;

//   Cart({
//     required this.id,
//     required this.name,
//     required this.rating,
//     required this.price,
//     required this.description,
//     required this.brandName,
//     required this.warranty,
//     required this.deliveryCharges,
//     required this.imageList,

//   });


//   factory Cart.fromJson(Map<String, dynamic> json) {
//     return Cart(
//       id: json['id'] ?? 0, // Default to 0 if null
//       name: json['name'] ?? 'No Name', // Default to 'No Name'
//       rating: (json['rating'] ?? 0).toDouble(), // Default to 0.0
//       price: (json['price'] ?? 0).toDouble(), // Default to 0.0
//       description: json['description'] ?? 'No Description', // Default to empty stringrating: (json['rating'] ?? 0).toDouble(), // Default to 0.0
//       brandName: json['brandName'] ?? 'no Brand', // Default to 0.0
//       warranty: json['warranty'] ?? " No Warranty" ,
//       deliveryCharges: ( json['deliveryCharges'] ?? 0 ).toDouble(),
//       imageList:  ( json['imageList'] ?? [] ),
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//       "rating": rating,
//       "price": price,
//       "description": description,
//       "brandName": brandName,
//       "warranty": warranty,
//       "deliveryCharges": deliveryCharges,
//       "imageList": imageList ,
//     };
//   }
// }