import 'dart:async';

import 'package:ecofriendlyinsects/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

String name = '';

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  String error = '';

  AnimationController animationController;
  AnimationController animationController2;
  AnimationController animationController3;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animationController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1800));
    animationController3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2600));

    animationController.forward();
    animationController2.forward();
    animationController3.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    animationController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(212, 248, 222, 1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80.0),
            FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: animationController)),
              child: Text(
                'Insetes for',
                style: TextStyle(
                  color: Colors.green[700],
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                  height: 1.4,
                ),
              ),
            ),
            FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: animationController)),
              child: Text(
                'Ecosystem',
                style: TextStyle(
                  color: Colors.green[700],
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                  height: 1.4,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 300,
                height: 300,
                child: FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          curve: Curves.fastOutSlowIn,
                          parent: animationController2)),
                  child: Image.asset('assets/ss.jpg'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        curve: Curves.fastOutSlowIn,
                        parent: animationController3)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.grey[700],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.green[800],
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 18.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                  color: Colors.green[800], width: 1.5),
                            ),
                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.green[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: RaisedButton(
                          onPressed: () {
                            if (name == '') {
                              setState(() {
                                error = 'Please enter your name';
                              });
                            } else {
                              setState(() {
                                animationController.reverse();
                                animationController2.reverse();
                                animationController3.reverse();
                              });
                              Timer(
                                  Duration(milliseconds: 1600),
                                  () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreen(), //TODO: HomePage widget
                                      )));
                            }
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 17.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          color: Colors.green[700],
                          child: Text(
                            'Go',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
