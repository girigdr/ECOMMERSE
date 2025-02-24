import 'ADMIN/adminPage1.dart';
import 'LOGIN/login_signin.dart';
import '/OpenPage/page1.dart';
import '/SELLER%20LOGIN%20AND%20DATA/AddProductBySeller.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false ,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0) , background: Colors.black, brightness: Brightness.dark)
        // ),
        // home: page1() ,
        home: Adminpage1() ,
        // home: LoginSignin() ,
        // home: UploadImagesScreen() ,

      )
  );
}