
import 'dart:math';

import 'package:untitled/OpenPage/page1.dart';

import '../LOGIN/login_signin.dart' show LoginSignin;
import '/OpenPage/Api.dart';
import '/SELLER%20LOGIN%20AND%20DATA/abc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ProductUploadScreen extends StatefulWidget {
  @override
  _ProductUploadScreenState createState() => _ProductUploadScreenState();
}

class _ProductUploadScreenState extends State<ProductUploadScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController warrantyController = TextEditingController();
  final TextEditingController deliveryChargesController = TextEditingController();

  late int counter ;

   Future<void> fetchCounter() async {
    final url = Uri.parse("http://localhost:8080/counter/current"); // Replace with your API URL

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          print( '1233455 ------ > ${int.parse( response.body ) } ' ) ;
          counter = int.parse(response.body); // Convert response to int
          print( counter ) ;
        });
      } else {
        print("Failed to fetch counter: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching counter: $error");
    }
  }

  @override
  void initState() {
    super.initState() ;
    fetchCounter();
     // Fetch counter when the page loads
  }


  @override
  Widget build(BuildContext context) {
    
    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;


    return Scaffold(
      appBar: AppBar(title: Text("Upload Product" , style: TextStyle( fontFamily: 'h1'),) , backgroundColor: 
            
            const Color.fromARGB(255, 250, 250, 250),
            actions: [
              Icon( 
                Icons.shop_2_sharp,
                color:  Color.fromARGB(0, 236, 98, 34)
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil( 
                    context ,
                    MaterialPageRoute(builder: (_) => LoginSignin() ) ,
                    (Route<dynamic> route) => false, 
                  ) ;
                },
                icon: Icon( 
                  Icons.logout_outlined,
                  color:  Color.fromARGB(255, 0, 0, 0)
                ),
              ),
              Icon( 
                Icons.shop_2_sharp,
                color:  Color.fromARGB(0, 236, 98, 34)
              ),
            ],
            
            ),
      body: Container(
        height: h ,
        width: w ,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 250, 250, 250),
            const Color.fromARGB(255, 134, 134, 134),
          ] ,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          ) ,

        ),
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text( "PRODUCT NAME" ) ,
              SizedBox(height: 20,),
              TextFeildMethod( nameController , "PRODUCT NAME" , TextInputType.text , w ) ,
              SizedBox(height: 20,),
              // Text( "PRODUCT RATING" ) ,
              // SizedBox(height: 10,),
              TextFeildMethod( ratingController , "PRODUCT RATING" , TextInputType.number , w ) ,
              SizedBox(height: 20,),
              // Text( "PRODUCT PRICE" ) ,
              // SizedBox(height: 10,),
              TextFeildMethod( priceController , "PRODUCT PRICE" , TextInputType.number, w  ) ,
              SizedBox(height: 20,),
              // Text( "PRODUCT DESCRIPTION" ) ,
              // SizedBox(height: 10,),
              TextFeildMethod( descriptionController , "PRODUCT DESCRIPTION" , TextInputType.text, w  ) ,
              SizedBox(height: 20,),
              // Text( "PRODUCT BRAND" ) ,
              // SizedBox(height: 10,),
              TextFeildMethod( brandNameController , "PRODUCT BRAND" , TextInputType.text , w ) ,
              SizedBox(height: 20,),
              // Text( "PRODUCT WARRENTY" ) ,
              // SizedBox(height: 10,),
              TextFeildMethod( warrantyController , "PRODUCT WARRENTY" , TextInputType.text, w  ) ,
              SizedBox(height: 20,),
              // Text( "PRODUCT DELIVERY CHARGES" ) ,
              // SizedBox(height: 10,),
              TextFeildMethod( deliveryChargesController , "PRODUCT DELIVERY CHARGES" , TextInputType.number , w ) ,
              const SizedBox(height: 40),
          
              // UploadImagesScreen( ) ,

              Stack(
                children: [
                  
                  Container(
                      height: max( h , w ) / 18 ,
                    width: w / 1.2,
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
                        "NEXT",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 19, 58, 43)
                        ),
                      ),
                    ),
                  ) ,

                  GestureDetector(
                    onTap: () {
                        if( ratingController.text == "" ||  
                            nameController.text == "" ||
                            priceController.text == "" ||  
                            descriptionController.text == "" ||
                            brandNameController.text == "" ||  
                            warrantyController.text == "" ||
                            deliveryChargesController.text == "" 
                         ) {
                            ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("FILL ALL THE FEILD" , style: TextStyle( color:  Colors.black),)  , backgroundColor: const Color.fromARGB(255, 158, 158, 158), behavior: SnackBarBehavior.floating ,));
                          } 
                        else {
                          Product map = Product(
                          id: - 1 ,
                          name: nameController.text,
                          rating: double.parse(ratingController.text) ,
                          price: double.parse(priceController.text), 
                          description: descriptionController.text ,
                          brandName: brandNameController.text ,
                          warranty: warrantyController.text, 
                          deliveryCharges: double.parse(deliveryChargesController.text),
                          imageList: []
                        ) ;

                        Navigator.push(context, MaterialPageRoute(builder: (_) =>UploadImagesScreen( map : map , counter : counter )  )


                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => UploadImagesScreen( map : map , counter : counter ) ),
                        //   (Route<dynamic> route) => false,
                        );
                        }
                        
                      },
                    child : Container(
                      height: max( h , w ) / 18 ,
                      width: w / 1.2,
                      color: const Color.fromARGB(0, 255, 193, 7),
                    )
                  ) ,


                ],
              ) ,
              
            ],
          ),
        ),
      ),
    );
  }

  TextField TextFeildMethod( TextEditingController c , String s, dynamic t , w ) {
    return TextField(
      controller: c ,
      // obscureText: widget.bo,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
        
          borderSide: BorderSide(color: 
                          Color.fromARGB(255, 143, 124, 179),),
          // borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:
                          Color.fromARGB(255, 32, 0, 61),),
          // borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        // prefixIconColor:  Color(0xff031481) ,
        labelText: s ,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 16, 58, 59)),
        hintText: 'ENTER $s' ,contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
      ),
        keyboardType: t ,
    ) ;
    
    
    
  }
}



    // TextField(
    //   controller: c,
    //   decoration: InputDecoration(
    //     hintText: s,
    //     filled: true,
    //     fillColor: const Color.fromARGB(255, 212, 212, 212), // Light grey background
    //     border: OutlineInputBorder(
          
    //       borderRadius: BorderRadius.circular(20), // Rounded corners
    //       borderSide: BorderSide.none, // No border
    //     ),
    //     focusedBorder: OutlineInputBorder(
          
    //       borderRadius: BorderRadius.circular(20),
    //       borderSide: BorderSide(color: const Color.fromARGB(255, 201, 200, 200), width: 2), // Blue border on focus
    //     ),
    //     contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 16), // Padding
    //   ),
      
    //     keyboardType: t ,
    // );


    
//   List<File> _images = [];

//   // Function to pick multiple images
//   Future<void> pickImages() async {
//     final ImagePicker picker = ImagePicker();
//     final List<XFile>? pickedFiles = await picker.pickMultiImage();

//     if (pickedFiles != null) {
//       setState(() {
//         _images = pickedFiles.map((file) => File(file.path)).toList();
//       });
//     }
//   }

//   // Function to upload product with images
//   Future<void> uploadProduct(BuildContext context) async {
//   var url = Uri.parse("http://192.168.181.144:8080/PRODUCT/addDataInDataBase");

//   var request = http.MultipartRequest('POST', url);
  
//   // Ensure product data is JSON
//   Map<String, dynamic> productData = {
//     "name": nameController.text,
//     "rating": double.tryParse(ratingController.text) ?? 0.0,
//     "price": double.tryParse(priceController.text) ?? 0.0,
//     "description": descriptionController.text,
//     "brandName": brandNameController.text,
//     "warranty": warrantyController.text,
//     "deliveryCharges": double.tryParse(deliveryChargesController.text) ?? 0.0,
//   };
  
//   request.fields['product'] = jsonEncode(productData);

//   // Attach multiple images
//   for (File image in _images) {
//     request.files.add(await http.MultipartFile.fromPath(
//       'images',
//       image.path,
//       contentType: MediaType('image', 'jpeg'), // Ensure correct MIME type
//     ));
//   }

//   try {
//     var response = await request.send();
//     var responseString = await response.stream.bytesToString();

//     if (!context.mounted) return;

//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload Successful")));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload Failed: ${response.statusCode}")));
//     }
//   } catch (e) {
//     if (!context.mounted) return;

//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
//   }
// }

