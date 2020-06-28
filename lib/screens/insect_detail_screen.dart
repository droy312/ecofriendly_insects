import 'package:flutter/material.dart';

class InsectDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  InsectDetailScreen(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});

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
        body: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.45,
              width: size.width,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 5.0,
                  right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey[800],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 50.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image(
                                image: AssetImage(widget.imageUrl),
                                height: 180.0,
                                width: 180.0,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 30.0,
                            bottom: 50.0,
                            child: Container(
                              width: 120.0,
                              child: Text(
                                widget.title,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
