
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/LOGIN/LoginApiCostomer.dart';

import 'loginApiSeller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool b = true ;
  Icon icon_eye = Icon(Icons.visibility) ;

  bool Met() {
    return b ;
  }



  TextEditingController user = TextEditingController() ;
  TextEditingController pass = TextEditingController() ;
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
                MaterialPageRoute(builder: (_) => LoginVENDOR() ) 
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
                  child: Text( "Log In For Costomer" , style: TextStyle( 
                    fontFamily: 'h1' ,
                    color: const Color.fromARGB(255, 236, 98, 34)
                  ),),
                ),
              )
            ),
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
                            "LOG IN",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 19, 58, 43)
                            ),
                          ),
                        ),
                      ) ,
          
                      GestureDetector(
                      onTap: () async {
                          await loginUser( user.text , pass.text , context );
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
            SizedBox(height: max( h , w ) / 100 ,),
              Center(
                child: Stack(
                    children: [
                      
                      Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.4,
                        decoration: BoxDecoration(
                           color:  Color.fromARGB(0, 255, 191, 131),
                          borderRadius: BorderRadius.all(Radius.circular(40 )) ,
                          // color: const Color.fromARGB(255, 84, 154, 219) 
                        //   gradient: LinearGradient(
                        //     colors: [
                        //       Color.fromARGB(255, 255, 191, 131),
                        //       Color.fromARGB(255, 255, 111, 28),
                        //     ],
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight,
                        //   ),
          
                        ),
                        child: Center(
                          child: Text(
                            "FORGET PASSWORD",
                            style: TextStyle(
                             color:  Color.fromARGB(255, 255, 60, 0)
                            ),
                          ),
                        ),
                      ) ,
          
                      GestureDetector(
                        onTap: () {
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

          ],
        ),
      ),
    );
  }
}




class LoginVENDOR extends StatefulWidget {
  const LoginVENDOR({super.key});

  @override
  State<LoginVENDOR> createState() => _LoginVENDORState();
}

class _LoginVENDORState extends State<LoginVENDOR> {

  bool b = true ;
  Icon icon_eye = Icon(Icons.visibility) ;

  bool Met() {
    return b ;
  }


  TextEditingController user = TextEditingController() ;
  TextEditingController pass = TextEditingController() ;

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
                MaterialPageRoute(builder: (_) => Login() ) 
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
                  child: Text( "Log In For Sellers" , style: TextStyle( 
                    fontFamily: 'h1' ,
                    color: const Color.fromARGB(255, 236, 98, 34)
                  ),),
                ),
              )
            ),
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
                            "LOG IN",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 19, 58, 43)
                            ),
                          ),
                        ),
                      ) ,
          
                      GestureDetector(
                        onTap: () async {
                          await loginSeller( user.text , pass.text , context );
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
            SizedBox(height: max( h , w ) / 100 ,),
              Center(
                child: Stack(
                    children: [
                      
                      Container(
                          height: max( h , w ) / 18 ,
                          width: w / 1.4,
                        decoration: BoxDecoration(
                           color:  Color.fromARGB(0, 255, 191, 131),
                          borderRadius: BorderRadius.all(Radius.circular(40 )) ,
                          // color: const Color.fromARGB(255, 84, 154, 219) 
                        //   gradient: LinearGradient(
                        //     colors: [
                        //       Color.fromARGB(255, 255, 191, 131),
                        //       Color.fromARGB(255, 255, 111, 28),
                        //     ],
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight,
                        //   ),
          
                        ),
                        child: Center(
                          child: Text(
                            "FORGET PASSWORD",
                            style: TextStyle(
                             color:  Color.fromARGB(255, 255, 60, 0)
                            ),
                          ),
                        ),
                      ) ,
          
                      GestureDetector(
                        onTap: () {
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

          ],
        ),
      ),
    );
  }
}
