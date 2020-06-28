import 'package:ecofriendlyinsects/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
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
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(), //TODO: HomePage widget 
                        ));
                  },
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  color: Colors.green[700],
                  child: Text(
                    'Get Started',
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
    );
  }
}