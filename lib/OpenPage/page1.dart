
import 'dart:math';

import '../LOGIN/login_signin.dart';
import '/OpenPage/Api.dart';
import '/OpenPage/CART/Cart.dart';
import '/OpenPage/productView.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';





//--------------------------------------------------------------------------
class page1 extends StatefulWidget {
  String user ;
  page1({super.key , required this.user });

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {


  // geting an data from backend for diaplaying list of products
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService.fetchProducts();
  }



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;

    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: w / 3  ,
                width: w / 3   ,
                color: const Color.fromARGB(0, 255, 193, 7),
              ) ,
              Container(
                height: w / 1.8  ,
                width: w / 1.8   ,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/logo.png"))
                ),

                // color: Colors.amber,
              ) ,
              Container(
                height: w / 15  ,
                width: w / 10   ,
                color: const Color.fromARGB(0, 255, 193, 7),
              ) ,
              Text( 'Hello ${widget.user}' , style: TextStyle( fontSize: w / 20  , color: const Color.fromARGB(255, 255, 94, 0) , fontFamily: 'h1'),)
            ],
          ),
        )
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 160, 201),
        actions: [
          IconButton( 
            
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: ( context ) => CartList( user : widget.user) ) ,
              ) ;
            },
            icon: Icon( Icons.shopping_cart)
          ) ,
          IconButton( 
            
            onPressed: () {

            },
            icon: Icon( Icons.search)
          ) ,
          IconButton( 
            
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginSignin() ),
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon( Icons.logout_rounded)
          ) ,
          Icon( Icons.abc , color: Colors.transparent,) ,
          
        ],
        
        // trailing: [
        //   Icon( Icons.cart),
        // ]
      ),
      
      body: FutureBuilder<List<Product>>(
      future: futureProducts, // Use FutureBuilder to wait for the data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator
        } 
        else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}")); // Show error
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No products available"));
        } else {
          final products = snapshot.data!; // Data is now available
          print( products.length ) ;
          return Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all( min( h , w ) / 20 ),
            height: h,
            child: Center(
              child: ListView.builder(
                
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListOfItems( h:  h , w:  w , ind: index , product : products , user : widget.user ) ;
                },
              ),
            ),
          ),
        ),
      ) ;
        }
      },
      
    ) 
    );
  }

}





class ListOfItems extends StatefulWidget {
  final double h, w ; int ind ; String user ;
  final List<Product> product ;
  ListOfItems({required this.h, required this.w , required this.ind , required this.product, required this.user });

  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  late PageController _pageController;
  late ValueNotifier<int> imageIdentification;

  
  

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);  // Start at 0 or saved index
    imageIdentification = ValueNotifier<int>(_pageController.initialPage);

    _pageController.addListener(() {
      int currentPage = _pageController.page?.round() ?? 0;
      if (imageIdentification.value != currentPage) {
        imageIdentification.value = currentPage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double hi = max( widget.h , widget.w ) / 8 < widget.h && max( widget.h , widget.w ) / 8 < widget.w ?    max( widget.h , widget.w ) / 8 : min( widget.h , widget.w ) / 8 ;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            print("object") ;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Productview( product : widget.product[ widget.ind ] , ind : widget.ind , user : widget.user  ) ),
            );
          },
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // boxShadow: [
            //   BoxShadow(
            //     color: const Color.fromARGB(255, 150, 144, 144) ,
            //     offset: Offset( 5.0 ,  5.0  ),
            //     blurRadius: 10 ,              )
            // ],
            // border: Border.all(
            //   width: 1 ,
            //   color: Colors.black
            // ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 143, 124, 179),
                Color.fromARGB(255, 170, 203, 212),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: max( widget.h , widget.w )  / 5,
          width: widget.w / 1.1,
          child: Row(
            children: [
              SizedBox(width: widget.w / 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7 ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
                              color: const Color.fromARGB(0, 255, 193, 7),
                              child: FittedBox(
                                child: Icon( Icons.arrow_left , color: const Color.fromARGB(255, 0, 0, 0),),
                                
                              ),
                            ) ,
                          
                          GestureDetector(
                            onTap: () {
                              if (_pageController.page!.toInt() > 0 ) {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _pageController.jumpToPage(widget.product[ widget.ind ].imageList.length- 1 ); // Go to first image if at the last one
                            }
                            },  
                            child: Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7   ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
                              color: const Color.fromARGB(0, 255, 192, 4),
                              ),
                            ),
                            
                        ],
                      ),
                      Container(
                        height: max( widget.h , widget.w ) / 8 < widget.h && max( widget.h , widget.w ) / 8 < widget.w ?    max( widget.h , widget.w ) / 8 : min( widget.h , widget.w ) / 8 ,
                        width: max( widget.h , widget.w ) / 8,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.only(left: 3),
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.product[ widget.ind ].imageList.length,
                          itemBuilder: (context, index) {
                            return Hero(
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.all(Radius.circular(10)),
                                // image: DecorationImage(
                                //   fit: BoxFit.contain,
                                tag: '${widget.ind}',
                                child: Image.network(
                                  widget.product[ widget.ind ].imageList[ index ],
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(child: CircularProgressIndicator());
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    print( error ) ;
                                    return Text("Failed to load image");
                                  },
                                ),
                            );
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7 ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
                              color: const Color.fromARGB(0, 255, 193, 7),
                              child: FittedBox(
                                child: Icon( Icons.arrow_right , color: const Color.fromARGB(255, 0, 0, 0),),
                              ),
                            ) ,
                          GestureDetector(
                            onTap: () {
                              if (_pageController.page!.toInt() < widget.product[ widget.ind ].imageList.length - 1) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                _pageController.jumpToPage(0); // Loop back to first image
                              }
                            },  
                            child: Container(
                              height: ( max( widget.h , widget.w )  / 5 ) / 7   ,
                              width:  ( max( widget.h , widget.w )  / 5 ) / 5  ,
                              color: const Color.fromARGB(0, 255, 192, 4),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: imageIdentification,
                    builder: (context, value, child) {
                      return Row(
                        children: List.generate(
                          widget.product[ widget.ind ].imageList.length,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.circle,
                              color: (value == i) ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 134, 134, 134),
                              size: 5,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(width: widget.w / 30),
              Container(
    
              ) ,
              Container(
                height: max( widget.h , widget.w )  / 5,
                width: (widget.w / 1.2) - (  ( max( widget.h , widget.w ) / 8 ) + ( 2 * ( ( max( widget.h , widget.w )  / 5 ) / 5 ) )  ) - (widget.w / 15) ,
                color: const Color.fromARGB(0, 255, 193, 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text( widget.product[ widget.ind ].name ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text( '${widget.product[ widget.ind ].rating}'  ) ,
                            Icon( Icons.star_border , size: 15,)
                          ],
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon( Icons.currency_rupee, size: 15,) ,
                            Text( '${widget.product[ widget.ind ].price}' ) ,
                          ],
                        )
                      ],
                    ),
                    
                  ],
                )
                
              
              ),
            ],
          ),
        ),
        ) ,
        
        SizedBox(height: min(widget.h, widget.w) / 20),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    imageIdentification.dispose();
    super.dispose();
  }
}



// import 'dart:io';
// import 'dart:math';
// import 'package:http/http.dart' as http;
// // import 'package:path_provider/path_provider.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import '../LOGIN/login_signin.dart';
// import '/OpenPage/Api.dart';
// import '/OpenPage/CART/Cart.dart';
// import '/OpenPage/productView.dart';
// import 'package:flutter/material.dart';

// class page1 extends StatefulWidget {
//   String user ;
//   page1({super.key , required this.user });

//   @override
//   State<page1> createState() => _page1State();
// }

// class _page1State extends State<page1> {


//   // geting an data from backend for diaplaying list of products
//   late Future<List<Product>> futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     futureProducts = ApiService.fetchProducts();
//   }



//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height ;
//     double w = MediaQuery.of(context).size.width ;

//     return Scaffold(
//       drawer: Drawer(
//         child: Column(
//           children: [
//             Container(
//               height: w / 3  ,
//               width: w / 3   ,
//               color: const Color.fromARGB(0, 255, 193, 7),
//             ) , 
//             Container(
//               height: w / 1.8  ,
//               width: w / 1.8   ,
//               decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage("assets/images/logo.png"))
//               ),
              
//               // color: Colors.amber,
//             ) ,
//             Container(
//               height: w / 15  ,
//               width: w / 10   ,
//               color: const Color.fromARGB(0, 255, 193, 7),
//             ) , 
//             Text( 'Hello ${widget.user}' , style: TextStyle( fontSize: w / 20  , color: const Color.fromARGB(255, 255, 94, 0) , fontFamily: 'h1'),)
//           ],
//         ),
//       ),

//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 174, 160, 201),
//         actions: [
//           IconButton( 
            
//             onPressed: () {
              
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: ( context ) => CartList( user : widget.user) ) ,
//               ) ;
//             },
//             icon: Icon( Icons.shopping_cart)
//           ) ,
//           IconButton( 
            
//             onPressed: () {

//             },
//             icon: Icon( Icons.search)
//           ) ,
//           IconButton( 
            
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (_) => LoginSignin() ),
//                 (Route<dynamic> route) => false,
//               );
//             },
//             icon: Icon( Icons.logout_rounded)
//           ) ,
//           Icon( Icons.abc , color: Colors.transparent,) ,
          
//         ],
        
//         // trailing: [
//         //   Icon( Icons.cart),
//         // ]
//       ),
      
//       body: FutureBuilder<List<Product>>(
//       future: futureProducts, // Use FutureBuilder to wait for the data
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator()); // Show loading indicator
//         } 
//         else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}")); // Show error
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text("No products available"));
//         } else {
//           final products = snapshot.data!; // Data is now available
//           print( products.length ) ;
//           return Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all( min( h , w ) / 20 ),
//             height: h,
//             child: Center(
//               child: ListView.builder(
                
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return ListOfItems( h:  h , w:  w , ind: index , product : products , user : widget.user ) ;
//                 },
//               ),
//             ),
//           ),
//         ),
//       ) ;

//         }
//       },
      
      
      
      
      
//     ) 
//     );
//   }

// }

// class ListOfItems extends StatefulWidget {
//   final double h, w ; int ind ; String user ;
//   final List<Product> product ;
//   ListOfItems({required this.h, required this.w , required this.ind , required this.product, required this.user });

//   @override
//   _ListOfItemsState createState() => _ListOfItemsState();
// }

// class _ListOfItemsState extends State<ListOfItems> {
//   late PageController _pageController;
//   late ValueNotifier<int> imageIdentification;

  
  

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);  // Start at 0 or saved index
//     imageIdentification = ValueNotifier<int>(_pageController.initialPage);

//     _pageController.addListener(() {
//       int currentPage = _pageController.page?.round() ?? 0;
//       if (imageIdentification.value != currentPage) {
//         imageIdentification.value = currentPage;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double hi = max( widget.h , widget.w ) / 8 < widget.h && max( widget.h , widget.w ) / 8 < widget.w ?    max( widget.h , widget.w ) / 8 : min( widget.h , widget.w ) / 8 ;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         InkWell(
//           onTap: () {
//             print("object") ;
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Productview( product : widget.product[ widget.ind ] , ind : widget.ind , user : widget.user  ) ),
//             );
//           },
//           child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             // boxShadow: [
//             //   BoxShadow(
//             //     color: const Color.fromARGB(255, 150, 144, 144) ,
//             //     offset: Offset( 5.0 ,  5.0  ),
//             //     blurRadius: 10 ,              )
//             // ],
//             // border: Border.all( 
//             //   width: 1 ,
//             //   color: Colors.black
//             // ),
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 143, 124, 179),
//                 Color.fromARGB(255, 170, 203, 212),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           height: max( widget.h , widget.w )  / 5,
//           width: widget.w / 1.1,
//           child: Row(
//             children: [
//               SizedBox(width: widget.w / 30),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Row(
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                               height: ( max( widget.h , widget.w )  / 5 ) / 7 ,
//                               width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
//                               color: const Color.fromARGB(0, 255, 193, 7),
//                               child: FittedBox(
//                                 child: Icon( Icons.arrow_left , color: const Color.fromARGB(255, 0, 0, 0),),
                                
//                               ),
//                             ) ,
                          
//                           GestureDetector(
//                             onTap: () {
//                               if (_pageController.page!.toInt() > 0 ) {
//                               _pageController.previousPage(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.easeInOut,
//                               );
//                             } else {
//                               _pageController.jumpToPage(widget.product[ widget.ind ].imageList.length- 1 ); // Go to first image if at the last one
//                             }
//                             },  
//                             child: Container(
//                               height: ( max( widget.h , widget.w )  / 5 ) / 7   ,
//                               width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
//                               color: const Color.fromARGB(0, 255, 192, 4),
//                               ),
//                             ),
                            
//                         ],
//                       ),
//                       Container(
//                         height: max( widget.h , widget.w ) / 8 < widget.h && max( widget.h , widget.w ) / 8 < widget.w ?    max( widget.h , widget.w ) / 8 : min( widget.h , widget.w ) / 8 ,
//                         width: max( widget.h , widget.w ) / 8,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(0, 0, 0, 0),
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                         padding: EdgeInsets.only(left: 3),
//                         child: PageView.builder(
//                           controller: _pageController,
//                           itemCount: widget.product[ widget.ind ].imageList.length,
//                           itemBuilder: (context, index) {
//                             return Hero(
//                               // decoration: BoxDecoration(
//                               //   borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 // image: DecorationImage(
//                                 //   fit: BoxFit.contain,
//                                 tag: '${widget.ind}',
//                                 child: Image.network(
//                                    widget.product[ widget.ind ].imageList[ index ]  ,
//                                   //  headers: {"Access-Control-Allow-Origin": "*"}
                                   
//                                   ) ,
//                             );
//                           },
//                         ),
//                       ),
//                       Stack(
//                         children: [
//                           Container(
//                             height: ( max( widget.h , widget.w )  / 5 ) / 7 ,
//                             width:  ( max( widget.h , widget.w )  / 5 ) / 7  ,
//                             color: const Color.fromARGB(0, 255, 193, 7),
//                             child: FittedBox(
//                               child: Icon( Icons.arrow_right , color: const Color.fromARGB(255, 0, 0, 0),),
//                             ),
//                           ) ,
//                           GestureDetector(
//                             onTap: () {
//                               if (_pageController.page!.toInt() < widget.product[ widget.ind ].imageList.length - 1) {
//                                 _pageController.nextPage(
//                                   duration: Duration(milliseconds: 300),
//                                   curve: Curves.easeInOut,
//                                 );
//                               } else {
//                                 _pageController.jumpToPage(0); // Loop back to first image
//                               }
//                             },
//                             child: Container(
//                               height: ( max( widget.h , widget.w )  / 5 ) / 7   ,
//                               width:  ( max( widget.h , widget.w )  / 5 ) / 5  ,
//                               color: const Color.fromARGB(0, 255, 192, 4),
//                             ),
//                           )
//                         ],
//                       ),

                      
                  
//                 ],
//               ),
//               ValueListenableBuilder<int>(
//                     valueListenable: imageIdentification,
//                     builder: (context, value, child) {
//                       return Row(
//                         children: List.generate(
//                           widget.product[ widget.ind ].imageList.length,
//                           (i) => Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5),
//                             child: Icon(
//                               Icons.circle,
//                               color: (value == i) ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 134, 134, 134),
//                               size: 5,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//               SizedBox(width: widget.w / 30),
//               Container(
//                 height: max( widget.h , widget.w )  / 5,
//                 width: (widget.w / 1.2) - (  ( max( widget.h , widget.w ) / 8 ) + ( 2 * ( ( max( widget.h , widget.w )  / 5 ) / 5 ) )  ) - (widget.w / 15) ,
//                 color: const Color.fromARGB(0, 255, 193, 7),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Wrap(
//                       children: [
//                         Text( widget.product[ widget.ind ].name ),
//                       ],
//                     ),
//                     Wrap(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text( '${widget.product[ widget.ind ].rating}'  ) ,
//                             Icon( Icons.star_border , size: 15,)
//                           ],
//                         )
//                       ],
//                     ),
//                     Wrap(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon( Icons.currency_rupee, size: 15,) ,
//                             Text( '${widget.product[ widget.ind ].price}' ) ,
//                           ],
//                         )
//                       ],
//                     ),
                    
//                   ],
//                 )
                
              
//               ),
//             ],
//           ),
//             ],
//          )
//        )
//         ),

//         SizedBox(height: min(widget.h, widget.w) / 20),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     imageIdentification.dispose();
//     super.dispose();
//   }
// }
