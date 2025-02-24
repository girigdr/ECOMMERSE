
import 'dart:math';

import 'package:flutter/material.dart';

import 'ProductDelete.dart';
class Adminpage1 extends StatefulWidget {
  const Adminpage1({super.key});

  @override
  State<Adminpage1> createState() => _Adminpage1State();
}

class _Adminpage1State extends State<Adminpage1> {
  @override
  Widget build(BuildContext context) {


    double h = MediaQuery.of(context).size.height ;
    double w = MediaQuery.of(context).size.width ;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox( height: max( h , w ) / 10 ,),
            Center(
              child :Stack(
                  children: [
                  Container(
                  height: max( h , w ) / 18 ,
              width: min( h , w ) / 1.4 ,
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
                Navigator.push(context, MaterialPageRoute( builder: (_) => ProductDelete() ) ) ;
              },
              child : Container(
                  height: max( h , w ) / 18 ,
                  width:min( h , w ) / 1.4 ,
                  color: const Color.fromARGB(0, 255, 193, 7),
            )
        ) ,


        ],
        ) ,
        ) ,
            SizedBox( height: 20 ,),

            // ----- 2
            Center(
              child :Stack(
                  children: [
                  Container(
                  height: max( h , w ) / 18 ,
              width: min( h , w ) / 1.4 ,
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
              },
              child : Container(
                  height: max( h , w ) / 18 ,
                  width:min( h , w ) / 1.4 ,
                  color: const Color.fromARGB(0, 255, 193, 7),
            )
        ) ,


        ],
        ) ,
        ) ,

            // ---- 3

            SizedBox( height: 20 ,),
            Center(
              child :Stack(
                children: [
                  Container(
                    height: max( h , w ) / 18 ,
                    width: min( h , w ) / 1.4 ,
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
                      },
                      child : Container(
                        height: max( h , w ) / 18 ,
                        width:min( h , w ) / 1.4 ,
                        color: const Color.fromARGB(0, 255, 193, 7),
                      )
                  ) ,


                ],
              ) ,
            ) ,
              SizedBox( height: max( h , w ) / 10 ,),



          ],
        ),
      )
    );
  }
}
