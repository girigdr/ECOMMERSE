import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import '/OpenPage/Api.dart';
import '/SELLER%20LOGIN%20AND%20DATA/AddProductBySeller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadImagesScreen extends StatefulWidget {
  Product map ; int counter ;
  UploadImagesScreen({super.key , required this.map , required this.counter });

  @override
  State<UploadImagesScreen> createState() => _UploadImagesScreenState();
}

class _UploadImagesScreenState extends State<UploadImagesScreen> {
  List<File> imageList = []; // MOBILE
  final List<Uint8List> _imageBytesList = []; //WEB
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;
  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageList.add(File(pickedFile.path));
  //     });
  //   }
  // }
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) {
        // For web, read the bytes.
        Uint8List bytes = await pickedFile.readAsBytes();
        setState(() {
          _imageBytesList.add(bytes);
        });
      } else {
        // For mobile, use File.
        setState(() {
          imageList.add(File(pickedFile.path));
        });
      }
    }
  }

// -----------------------------------------------------------
  
  Future<int> incrementCounter() async {
  final url = Uri.parse("http://localhost:8080/counter/increment");

  final response = await http.post(url);

  if (response.statusCode == 200) {
    return int.parse(response.body); // Returns updated count
  } else {
    throw Exception("Failed to increment counter");
  }
}



// -----------------------------------------------------------------------
  
  
  // Future<void> _uploadImages() async {
  //   if (imageList.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Please select at least one image")));
  //     return;
  //   }
  //   print ( widget.counter ) ;

  //   final uri = Uri.parse('http://192.168.181.144:8080/images/upload/${widget.counter}');
  //   final request = http.MultipartRequest('POST', uri);

  //   for (File image in imageList) {
  //     request.files.add(await http.MultipartFile.fromPath('images', image.path));
  //   }

  //   try {
  //     final response = await request.send();
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("Upload Successful" ,style: TextStyle( color:  Colors.black),)  , backgroundColor: const Color.fromARGB(255, 158, 158, 158), behavior: SnackBarBehavior.floating ,));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text("Upload Failed. Status: ${response.statusCode}",style: TextStyle( color:  Colors.black),)  , backgroundColor: const Color.fromARGB(255, 158, 158, 158), behavior: SnackBarBehavior.floating ,));
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Error: $e", style: TextStyle( color:  Colors.black),)  , backgroundColor: const Color.fromARGB(255, 158, 158, 158), behavior: SnackBarBehavior.floating ,));
  //   }
  // }

  Future<void> _uploadImages() async {
    if ((!kIsWeb && imageList.isEmpty) ||
        (kIsWeb && _imageBytesList.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select at least one image")),
      );
      return;
    }

    final uri = Uri.parse(
        'http://localhost:8080/images/upload/${widget.counter}');
    final request = http.MultipartRequest('POST', uri);

    try {
      if (kIsWeb) {
        // On web, you cannot directly use MultipartFile.fromPath.
        // You need to create the MultipartFile from bytes.
        for (int i = 0; i < _imageBytesList.length; i++) {
          request.files.add(
            http.MultipartFile.fromBytes(
              'images', 
              _imageBytesList[i],
              filename: "image_$i.png", // Provide a filename
            ),
          );
        }
      } else {
        // For mobile/desktop.
        for (File image in imageList) {
          request.files.add(await http.MultipartFile.fromPath('images', image.path));
        }
      }

      final response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "Upload Successful",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: const Color.fromARGB(255, 158, 158, 158),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Upload Failed. Status: ${response.statusCode}",
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: const Color.fromARGB(255, 158, 158, 158),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: $e",
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 158, 158, 158),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  
  @override
  Widget build(BuildContext context) {

    
    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;
    final int imageCount = kIsWeb ? _imageBytesList.length : imageList.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: 
            const Color.fromARGB(255, 250, 250, 250),
            title: const Text('Upload Images', style: TextStyle( fontFamily: 'h1') )
        
        ),
      body: Container( 
        height: h,
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
                
            Expanded(
              child: GridView.builder(
                itemCount: imageCount,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  return kIsWeb
                      ? Image.memory(
                          _imageBytesList[index],
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          imageList[index],
                          fit: BoxFit.cover,
                        );
                },
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
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
                        "ADD IMAGE",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0)
                        ),
                      ),
                    ),
                  ) ,

                  GestureDetector(
                    onTap:_pickImage,
                    child : Container(
                      height: max( h , w ) / 18 ,
                      width: w / 1.3,
                      color: const Color.fromARGB(0, 255, 193, 7),
                    )
                  ) ,


                ],
              ) ,
               SizedBox(height: 10),

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
                        "ADD PRODUCT FOR SALE",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0)
                        ),
                      ),
                    ),
                  ) ,

                  GestureDetector(
                    onTap: _isUploading
                      ? null
                      : () async {
                        if (imageList.isEmpty && _imageBytesList.isEmpty ) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(  content: Text("Please select at least one image",style: TextStyle( color:  Colors.black),)  , backgroundColor: const Color.fromARGB(255, 158, 158, 158), behavior: SnackBarBehavior.floating ,));
                            return;
                          }
                          else {
                            setState(
                            (){
                               _isUploading = true ;
                            }
                          );
                          print ( widget.counter ) ;
                          Product send = Product( id: widget.counter, 
                                                  name: widget.map.name, 
                                                  rating: widget.map.rating,
                                                  price: widget.map.price, 
                                                  description: widget.map.description, 
                                                  brandName: widget.map.brandName,
                                                  warranty: widget.map.warranty, 
                                                  deliveryCharges: widget.map.deliveryCharges, 
                                                  imageList: widget.map.imageList
                          ) ;
                          

                            await ApiService.addProduct( send ); 
                            await _uploadImages() ; // First API call// Second API call (after first is done)
                            await incrementCounter() ;
                          
                          

                          setState(() => _isUploading = false);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) =>ProductUploadScreen() ),
                            (Route<dynamic> route) => false,
                          );
                        }
                          
                        },
                    child : Container(
                      height: max( h , w ) / 18 ,
                      width: w / 1.3,
                      color: const Color.fromARGB(0, 255, 193, 7),
                    )
                  ) ,


                ],
              ) ,
               SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
