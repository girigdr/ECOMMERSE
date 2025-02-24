

import 'dart:convert';
import '/OpenPage/page1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';


Future<void> loginUser(String user, String pass, BuildContext context) async {
  try {
    // Build URL dynamically
    final url = "http://localhost:8080/login/sendData/$user/$pass";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Optionally log that the request succeeded
      print("Login successful. Parsing JSON...");

      // Try decoding the JSON response
      final Map<String, dynamic> jsonData = json.decode(response.body);

      print("Parsed JSON: $jsonData");

      // Navigate to the next page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => page1( user : user  )),
            (Route<dynamic> route) => false,
      );
    } else if (response.statusCode == 455) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("USER NOT FOUND")),
      );
    } else if (response.statusCode == 456) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("INCORRECT PASSWORD")),
      );
    } else {
      // Print out the response body for further inspection
      print("Unexpected status code: ${response.statusCode}");
      print("Response body: ${response.body}");
      throw Exception("Failed to load data. Status code: ${response.statusCode}");
    }
  } catch (e) {
    // Log the error for debugging
    print("Error during login: $e");

    // Optionally, show a generic error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("An error occurred during login.")),
    );
  }
}



Future<void> registerUser(String userName, String password, String name , BuildContext context ) async {
  final Uri url = Uri.parse('http://localhost:8080/sign_in/addData/'); // Replace with your API URL

  final Map<String, String> body = {
    'userName': userName,
    'password': password,
    'name': name,
  };

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    ScaffoldMessenger
    .of(context)
    .showSnackBar(
      SnackBar(
        content: Text("SIGN IN SUCCESSFULL")
      )
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => page1( user : userName )),
      (Route<dynamic> route) => false,
    );


    print('User registered successfully!');
  }
  else if( response.statusCode == 457  ) {
    ScaffoldMessenger
    .of(context)
    .showSnackBar(
          SnackBar(
            content: Text("USER ALREADY EXIST")
          )
        );
  }
   else {
    print('Failed to register: ${response.body}');
  }
}
