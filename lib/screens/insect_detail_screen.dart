import 'dart:ui';

import 'package:flutter/material.dart';

class InsectDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String header;

  InsectDetailScreen(
      {@required this.imageUrl,
      @required this.title,
      @required this.description, 
      @required this.header});

  @override
  _InsectDetailScreenState createState() => _InsectDetailScreenState();
}

class _InsectDetailScreenState extends State<InsectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.8,
              fontFamily: "Poppins",
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: size.width,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(widget.imageUrl, fit: BoxFit.fitWidth),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          //boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0.0, 4.0), blurRadius: 6.0)]
                          ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Image.asset(widget.imageUrl)),
                    ),
                  ],
                ),
                // padding: EdgeInsets.only(
                //     top: MediaQuery.of(context).padding.top,
                //     left: 5.0,
                //     right: 5.0),
                //*child: Image.asset(widget.imageUrl),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Expanded(
                //       child: Container(
                //         child: Stack(
                //           children: <Widget>[
                //             Positioned(
                //               left: 50.0,
                //               child: Align(
                //                 alignment: Alignment.centerLeft,
                //                 child: Image(
                //                   image: AssetImage(widget.imageUrl),
                //                   height: 180.0,
                //                   width: 180.0,
                //                 ),
                //               ),
                //             ),
                //             Positioned(
                //               right: 30.0,
                //               bottom: 50.0,
                //               child: Container(
                //                 width: 120.0,
                //                 child: Text(
                //                   widget.title,
                //                   textAlign: TextAlign.right,
                //                   style: TextStyle(
                //                     fontSize: 25.0,
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.black,
                //                     fontFamily: "Poppins",
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: size.height * 0.55,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      widget.header,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SingleChildScrollView(
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                          fontFamily: "Poppins",
                          height: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
