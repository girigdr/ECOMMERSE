

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/ADMIN/ProductView.dart';
import 'package:untitled/OpenPage/Api.dart';


class ProductDelete extends StatefulWidget {
  const ProductDelete({super.key});

  @override
  State<ProductDelete> createState() => _ProductDeleteState();
}

class _ProductDeleteState extends State<ProductDelete> {


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
                  return ListOfItems( h:  h , w:  w , ind: index , product : products ) ;
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
  final double h, w ; int ind ;
  final List<Product> product ;
  ListOfItems({required this.h, required this.w , required this.ind , required this.product });

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
              MaterialPageRoute(builder: (context) => Productview( product : widget.product[ widget.ind ] , ind : widget.ind ) ),
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
