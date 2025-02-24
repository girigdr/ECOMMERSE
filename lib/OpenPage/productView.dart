


import 'dart:math';

import '/OpenPage/Api.dart';
import '/OpenPage/CART/Cart.dart';
import '/OpenPage/CART/CartApi.dart';
import 'package:flutter/material.dart';


// List < dynamic > image = 
//     [
//       "assets/images/h1.jpg",
//       "assets/images/h2.jpg",
//       "assets/images/h3.jpg",
//       "assets/images/h4.jpg",
//       "assets/images/h5.jpg",
//       "assets/images/h6.jpg",
//     ]  ;



class Productview extends StatefulWidget {
  Product product ; int ind ; String user ;
  Productview({super.key , required this.product ,required this.ind , required this.user } );

  @override
  State<Productview> createState() => _ProductviewState();
}

class _ProductviewState extends State<Productview> {


  late ValueNotifier<int> imageIdentification;
  late PageController _pageController;

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
    void dispose() {
      _pageController.dispose();
      imageIdentification.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    
    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;


   

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 104, 94, 65),
        actions: [
          IconButton( 
            
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: ( context ) => CartList( user : widget.user ) ) ,
              ) ;
            },
            icon: Icon( Icons.shopping_cart)
          ) ,
          IconButton( 
            
            onPressed: () {

            },
            icon: Icon( Icons.search)
          ) ,
          Icon( Icons.abc , color: Colors.transparent,) ,
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [


              Container(
                    height: max(h, w) / 1.7,
                    width: w /1.1,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(0, 0, 0, 0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.only(left: 3),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.product.imageList.length,
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: '${widget.ind}',
                          child: Image.network(  widget.product.imageList[ index] ) ,
                          
                        );
                      },
                    ),
                    ),





              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                          height: ( max( h , w )  / 5 ) / 3 ,
                          width:  ( max( h , w )  / 5 ) / 3  ,
                          color: const Color.fromARGB(0, 255, 193, 7),
                          child: Icon( Icons.arrow_left_outlined ,  size: min( h , w ) / 15  , color: const Color.fromRGBO(114, 114, 114, 1),),
                        ) ,
                      
                      GestureDetector(
                        onTap: () {
                          if (_pageController.page!.toInt() > 0 ) {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          _pageController.jumpToPage(widget.product.imageList.length - 1 ); // Go to first image if at the last one
                        }
                        },  
                        child: Container(
                          height: ( max( h , w )  / 5 ) / 3   ,
                          width:  ( max( h , w )  / 5 ) / 3  ,
                          color: const Color.fromARGB(0, 255, 191, 0),
                          ),
                        ),
                        
                    ],
                  ),
                  
                  Stack(
                    children: [
                      Container(
                          height: ( max( h , w )  / 5 ) / 3 ,
                          width:  ( max( h , w )  / 5 ) / 3  ,
                          color: const Color.fromARGB(0, 255, 193, 7),
                          child: Icon( Icons.arrow_right_outlined , size: min( h , w ) / 15 ,color:  const Color.fromRGBO(114, 114, 114, 1),),
                        ) ,
                      GestureDetector(
                        onTap: () {
                          if (_pageController.page!.toInt() < widget.product.imageList.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            _pageController.jumpToPage(0); // Loop back to first image
                          }
                        },  
                        child: Container(
                          height: ( max( h , w )  / 5 ) / 3   ,
                          width:  ( max( h , w )  / 5 ) / 3  ,
                          color: const Color.fromARGB(0, 255, 192, 4),
                          ),
                        )
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder<int>(
                        valueListenable: imageIdentification,
                        builder: (context, value, child) {
                          return Row(
                            children: List.generate(
                              widget.product.imageList.length,
                              (i) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.circle,
                                  color: (value == i) ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 204, 204, 204),
                                  size: 5,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                ],
              ),
              
              SizedBox(height: 30,) ,

              Column(
                
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: w / 20 ,) ,
                      Text( 'BRAND : ${widget.product.brandName}' ,style: TextStyle(
                        color: const Color.fromARGB(255, 0, 82, 42)
                      ),),
                    ],
                  ) ,
                  SizedBox(height: 10,) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: w / 20 ,) ,
                      Text( 'PRODUCT NAME : ${widget.product.name}' ,style: TextStyle(
                        color: const Color.fromARGB(255, 4, 0, 255)
                      ),),
                    ],
                  ) ,
                  SizedBox(height: 10,) ,
                  Padding(
                    padding: EdgeInsets.only( left: w / 20  ),
                    child: Wrap(
                      children: [
                        Text( 'DESCRIPTION : \n${widget.product.description}' ,style: TextStyle(
                          color: const Color.fromARGB(255, 0, 60, 129)
                        ),),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20,) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: w / 20 ,) ,
                      Icon( Icons.currency_rupee , size: 10 ,) ,
                      // SizedBox(width: 5,) ,
                      Wrap(
                        children: [
                          Text(  '${widget.product.price}' ,style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0)
                          ),),
                        ],
                      ),
                    ],
                  ) ,
                ],
              ) ,
              SizedBox(height: 40,) ,

              Stack(
                children: [
                  
                  Container(
                      height: max( h , w ) / 18 ,
                    width: w / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40 )) ,
                      // color: const Color.fromARGB(255, 84, 154, 219) 
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 143, 124, 179),
                          Color.fromARGB(255, 162, 255, 243),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                    ),
                    child: Center(
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 19, 58, 43)
                        ),
                      ),
                    ),
                  ) ,
                  GestureDetector(
                    onTap: () {
                      print("object") ;
                    },
                    child : Container(
                      height: max( h , w ) / 18 ,
                      width: w / 1.3,
                      color: const Color.fromARGB(0, 255, 193, 7),
                    )
                  ) ,
                ],
              ) ,

              
              SizedBox(height: 20,) ,

              Stack(
                children: [
                  
                  Container(
                      height: max( h , w ) / 18 ,
                    width: w / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40 )) ,
                      // color: const Color.fromARGB(255, 84, 154, 219) 
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 143, 124, 179),
                          Color.fromARGB(255, 162, 255, 243),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                    ),
                    child: Center(
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 19, 58, 43)
                        ),
                      ),
                    ),
                  ) ,

                  GestureDetector(
                    onTap: () async {
                      await CartApi.addProductToCart( context , widget.user , widget.product.id ) ;
                    },
                    child : Container(
                      height: max( h , w ) / 18 ,
                      width: w / 1.3,
                      color: const Color.fromARGB(0, 255, 193, 7),
                    )
                  ) ,


                ],
              ) ,
              SizedBox(height: 120,) ,
            ],
          ),
        ),
      ),

    );
  }
}