

import 'dart:math';

import '/LOGIN/login.dart';
import '/LOGIN/signIn.dart';
import 'package:flutter/material.dart';

class LoginSignin extends StatefulWidget {
  const LoginSignin({super.key});

  @override
  State<LoginSignin> createState() => _LoginSigninState();
}

class _LoginSigninState extends State<LoginSignin> {
  @override
  Widget build(BuildContext context) {
    
    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;




    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: h /10 ,) ,
              Center(
                child: Container(
                  height: min( h , w ) / 2 ,
                  width: min( h , w ) / 2  ,
                  child: Hero(
                    tag: 'logo',
                    child: Image(image: AssetImage("assets/images/logo.png")),
                  ),
                
                ),
              ),
              SizedBox(height: max( h , w ) / 60 ,) ,
              Center(
                child: Container(
                  height: max( h , w )  / 12  ,
                  width: w / 1.2 ,
                  color: const Color.fromARGB(0, 43, 255, 0),
                  child: FittedBox(
                    child: Text( "WELCOME To MY ECOM..." , style: TextStyle( 
                      fontFamily: 'h1' ,
                      color: const Color.fromARGB(255, 236, 98, 34)
                    ),),
                  ),
                )
              ),
              SizedBox(height: max( h , w ) / 20 ,) ,
              Center(
                child: Stack(
                    children: [
                      
                      Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40 )) ,
                          // color: const Color.fromARGB(255, 84, 154, 219) 
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 191, 131),
                              Color.fromARGB(255, 255, 111, 28),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
          
                        ),
                        child: Center(
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 19, 58, 43)
                            ),
                          ),
                        ),
                      ) ,
          
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: ( context ) => Login() ) ,
                          ) ;
                        },
                        child : Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.3,
                          color: const Color.fromARGB(0, 255, 193, 7),
                        )
                      ) ,
          
          
                    ],
                  ) ,
              ),
              SizedBox(height: max( h , w ) / 50 ,) ,
              Center(
                child: Stack(
                    children: [
                      
                      Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40 )) ,
                          // color: const Color.fromARGB(255, 84, 154, 219) 
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 191, 131),
                              Color.fromARGB(255, 255, 111, 28),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
          
                        ),
                        child: Center(
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 19, 58, 43)
                            ),
                          ),
                        ),
                      ) ,
          
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: ( context ) => Signin() ) ,
                          ) ;
                        },
                        child : Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.3,
                          color: const Color.fromARGB(0, 255, 193, 7),
                        )
                      ) ,
          
          
                    ],
                  ) ,
              ),
              SizedBox(height: max( h , w ) / 20 ,) ,
          
            ],
          ),
        ),
      ),
    );
  }
}