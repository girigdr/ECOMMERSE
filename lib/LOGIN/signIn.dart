
import 'dart:math';

import '/LOGIN/LoginApiCostomer.dart';
import 'package:flutter/material.dart';

import 'loginApiSeller.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  bool b = true ;
  Icon icon_eye = Icon(Icons.visibility) ;

  
  bool b1 = true ;
  Icon icon_eye1 = Icon(Icons.visibility) ;

  bool Met() {
    return b ;
  }

  bool Met1() {
    return b1 ;
  }


  TextEditingController user = TextEditingController() ;
  TextEditingController name = TextEditingController() ;
  TextEditingController pass = TextEditingController() ;
  TextEditingController confrimPass = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    


    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;



    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement( 
                context ,
                MaterialPageRoute(builder: (_) => SigninVENDOR() ) 
              ) ;
            },
            icon: Icon( 
              Icons.shop_2_sharp,
              color:  Color.fromARGB(255, 236, 98, 34)
            ),
          ),
          Icon( 
            Icons.shop_2_sharp,
            color:  Color.fromARGB(0, 236, 98, 34)
          ),
          Icon( 
            Icons.shop_2_sharp,
            color:  Color.fromARGB(0, 236, 98, 34)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: max( h , w ) / 10 ,),
            Center(
              child: Container(
                height: min( h , w ) / 2.3 ,
                width: min( h , w ) / 2.3  ,
                child: Hero(
                  tag: 'logo',
                  child: Image(image: AssetImage("assets/images/logo.png")),
                ),
              ),
            ),
            Center(
              child: Container(
                height: max( h , w )  / 25  ,
                width: w / 1.2 ,
                color: const Color.fromARGB(0, 43, 255, 0),
                child: FittedBox(
                  child: Text( "Sign In As Costomer" , style: TextStyle( 
                    fontFamily: 'h1' ,
                    color: const Color.fromARGB(255, 236, 98, 34)
                  ),),
                ),
              )
            ),
             SizedBox(height: max( h , w ) / 20 ,),Padding( 


               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10  ),
               child: TextField(
                controller: name ,
                     // obscureText: widget.bo,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                  
                    borderSide: BorderSide(color: 
                                    Color.fromARGB(255, 255, 60, 0),),
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:
                                    Color.fromARGB(255, 255, 60, 0),),
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  // prefixIconColor:  Color(0xff031481) ,
                  labelText: "NAME" ,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 60, 0)
                  ),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 85, 78)
                  ),
                  hintText: 'ENTER NAME' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                ),
              ),
             ) ,
           SizedBox(height: max( h , w ) / 20 ,),


             Padding( 
               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10   ),
               child: TextField(
                  controller: user ,
                     // obscureText: widget.bo,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    
                      borderSide: BorderSide(color: 
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // prefixIconColor:  Color(0xff031481) ,
                    labelText: "USER NAME" ,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 60, 0)
                    ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 85, 78)
                    ),
                    hintText: 'ENTER USER NAME' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
             ) ,
             SizedBox(height: max( h , w ) / 20 ,),
             Padding( 
               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10  ),
               child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: Met(),
                  
                  controller: pass ,
                     // obscureText: widget.bo,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    
                      borderSide: BorderSide(color: 
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // prefixIconColor:  Color(0xff031481) ,
                    labelText: "PASSWORD" ,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 60, 0)
                    ),
                    suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if( b ) {
                                b = false ;
                                icon_eye = Icon( Icons.visibility_off ) ;
                              }
                              else {
                                b = true ;
                                icon_eye = Icon( Icons.visibility ) ;
                              }
                            });
                          },
                          icon: icon_eye
                      ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 85, 78)
                    ),
                    hintText: 'ENTER PASSWORD' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
             ) ,
           SizedBox(height: max( h , w ) / 20 ,),


            Padding( 
               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10  ),
               child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: Met1(),
                  
                  controller: confrimPass ,
                     // obscureText: widget.bo,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    
                      borderSide: BorderSide(color: 
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // prefixIconColor:  Color(0xff031481) ,
                    labelText: "CONFRIM PASSWORD" ,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 60, 0)
                    ),
                    suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if( b1 ) {
                                b1 = false ;
                                icon_eye1 = Icon( Icons.visibility_off ) ;
                              }
                              else {
                                b1 = true ;
                                icon_eye1 = Icon( Icons.visibility ) ;
                              }
                            });
                          },
                          icon: icon_eye1
                      ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 85, 78)
                    ),
                    hintText: 'ENTER PASSWORD' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
             ) ,
           SizedBox(height: max( h , w ) / 20 ,),
           


           Center(
                child: Stack(
                    children: [
                      
                      Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.4,
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
                        onTap: () async {
                          if( pass.text != confrimPass.text ) {
                            ScaffoldMessenger
                            .of(context)
                            .showSnackBar(
                              SnackBar(
                                content: Text("PASSWORD INCORRECT")
                              )
                            );
                          } 
                          else {
                            await registerUser( user.text , pass.text , name.text , context );
                          }
                        } ,
                        child : Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.3,
                          color: const Color.fromARGB(0, 255, 193, 7),
                        )
                      ) ,
          
          
                    ],
                  ) ,
              ),
            SizedBox(height: max( h , w ) / 100 ,),
              

          ],
        ),
      ),
    );
  }
}






class SigninVENDOR extends StatefulWidget {
  const SigninVENDOR({super.key});

  @override
  State<SigninVENDOR> createState() => _SigninVENDORState();
}

class _SigninVENDORState extends State<SigninVENDOR> {

  bool b = true ;
  Icon icon_eye = Icon(Icons.visibility) ;

  
  bool b1 = true ;
  Icon icon_eye1 = Icon(Icons.visibility) ;

  bool Met() {
    return b ;
  }

  bool Met1() {
    return b1 ;
  }


  TextEditingController user = TextEditingController() ;
  TextEditingController name = TextEditingController() ;
  TextEditingController pass = TextEditingController() ;
  TextEditingController confrimPass = TextEditingController() ;
  TextEditingController brand = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    


    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;



    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement( 
                context ,
                MaterialPageRoute(builder: (_) => Signin() ) 
              ) ;
            },
            icon: Icon( 
              Icons.person,
              color:  Color.fromARGB(255, 236, 98, 34)
            ),
          ),
          Icon( 
            Icons.shop_2_sharp,
            color:  Color.fromARGB(0, 236, 98, 34)
          ),
          Icon( 
            Icons.shop_2_sharp,
            color:  Color.fromARGB(0, 236, 98, 34)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: max( h , w ) / 10 ,),
            Center(
              child: Container(
                height: min( h , w ) / 2.3 ,
                width: min( h , w ) / 2.3  ,
                child: Hero(
                  tag: 'logo',
                  child: Image(image: AssetImage("assets/images/logo.png")),
                ),
              ),
            ),
            Center(
              child: Container(
                height: max( h , w )  / 25  ,
                width: w / 1.2 ,
                color: const Color.fromARGB(0, 43, 255, 0),
                child: FittedBox(
                  child: Text( "Sign In As Seller" , style: TextStyle( 
                    fontFamily: 'h1' ,
                    color: const Color.fromARGB(255, 236, 98, 34)
                  ),),
                ),
              )
            ),
             SizedBox(height: max( h , w ) / 20 ,),Padding( 


               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10  ),
               child: TextField(
                controller: name ,
                     // obscureText: widget.bo,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                  
                    borderSide: BorderSide(color: 
                                    Color.fromARGB(255, 255, 60, 0),),
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:
                                    Color.fromARGB(255, 255, 60, 0),),
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  // prefixIconColor:  Color(0xff031481) ,
                  labelText: "NAME" ,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 60, 0)
                  ),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 85, 78)
                  ),
                  hintText: 'ENTER NAME' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                ),
              ),
             ) ,
             SizedBox(height: max( h , w ) / 20 ,),


             Padding( 
               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10   ),
               child: TextField(
                  controller: brand ,
                     // obscureText: widget.bo,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    
                      borderSide: BorderSide(color: 
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // prefixIconColor:  Color(0xff031481) ,
                    labelText: "BRAND NAME" ,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 60, 0)
                    ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 85, 78)
                    ),
                    hintText: 'ENTER BRAND NAME' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
             ) ,
           SizedBox(height: max( h , w ) / 20 ,),


             Padding( 
               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10   ),
               child: TextField(
                  controller: user ,
                     // obscureText: widget.bo,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    
                      borderSide: BorderSide(color: 
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // prefixIconColor:  Color(0xff031481) ,
                    labelText: "USER NAME" ,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 60, 0)
                    ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 85, 78)
                    ),
                    hintText: 'ENTER USER NAME' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
             ) ,
             SizedBox(height: max( h , w ) / 20 ,),
             Padding( 
               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10  ),
               child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: Met(),
                  
                  controller: pass ,
                     // obscureText: widget.bo,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    
                      borderSide: BorderSide(color: 
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // prefixIconColor:  Color(0xff031481) ,
                    labelText: "PASSWORD" ,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 60, 0)
                    ),
                    suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if( b ) {
                                b = false ;
                                icon_eye = Icon( Icons.visibility_off ) ;
                              }
                              else {
                                b = true ;
                                icon_eye = Icon( Icons.visibility ) ;
                              }
                            });
                          },
                          icon: icon_eye
                      ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 85, 78)
                    ),
                    hintText: 'ENTER PASSWORD' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
             ) ,
           SizedBox(height: max( h , w ) / 20 ,),


            Padding( 
               padding:  EdgeInsets.only( left  : w / 10 , right: w / 10  ),
               child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: Met1(),
                  
                  controller: confrimPass ,
                     // obscureText: widget.bo,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    
                      borderSide: BorderSide(color: 
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                                      Color.fromARGB(255, 255, 60, 0),),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // prefixIconColor:  Color(0xff031481) ,
                    labelText: "CONFRIM PASSWORD" ,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 60, 0)
                    ),
                    suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if( b1 ) {
                                b1 = false ;
                                icon_eye1 = Icon( Icons.visibility_off ) ;
                              }
                              else {
                                b1 = true ;
                                icon_eye1 = Icon( Icons.visibility ) ;
                              }
                            });
                          },
                          icon: icon_eye1
                      ),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 85, 78)
                    ),
                    hintText: 'ENTER PASSWORD' ,contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
             ) ,
           SizedBox(height: max( h , w ) / 20 ,),
           


           Center(
                child: Stack(
                    children: [
                      
                      Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.4,
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
                        onTap: () async {
                          if( pass.text != confrimPass.text ) {
                            ScaffoldMessenger
                            .of(context)
                            .showSnackBar(
                              SnackBar(
                                content: Text("PASSWORD INCORRECT")
                              )
                            );
                          } 
                          else {
                            await registerSeller( user.text , pass.text , name.text , brand.text ,context );
                          }
                        } ,
                        child : Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.3,
                          color: const Color.fromARGB(0, 255, 193, 7),
                        )
                      ) ,
          
          
                    ],
                  ) ,
              ),
            SizedBox(height: max( h , w ) / 100 ,),
              

          ],
        ),
      ),
    );
  }
}

