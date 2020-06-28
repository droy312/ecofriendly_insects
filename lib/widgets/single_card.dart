import 'package:ecofriendlyinsects/screens/insect_detail_screen.dart';
import 'package:ecofriendlyinsects/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class SingleCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String header;

  SingleCard({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.header,
  });

  @override
  _SingleCardState createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onDoubleTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'Thanks $name, I will not sting or bite you. :)',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins'
              ),
            ),
            backgroundColor: Colors.green[800],
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 3.0),
                blurRadius: 6.0,
              )
            ],
          ),
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[50],
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(
                          widget.imageUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15.0,
                      left: 15.0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.white38,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            shadows: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 4),
                            ],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InsectDetailScreen(
                                    imageUrl: widget.imageUrl,
                                    title: widget.title,
                                    description: widget.description,
                                    header: widget.header,
                                  )));
                        },
                        child: Text(
                          "Show more",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.green[800],
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
