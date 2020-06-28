import 'package:ecofriendlyinsects/screens/article_screen.dart';
import 'package:ecofriendlyinsects/screens/carousel_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _navigationScreens = [
    CarouselScreen(),
    ArticleScreen(),
  ];

  getRadianFromDegree(double degree) {
    double unitRadian = 0.0174532925;
    double radian = degree * unitRadian;
    return radian;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "HOME",
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
        body: Row(
          children: <Widget>[
            Container(
              width: 70.0,
              color: Color.fromRGBO(212, 248, 222, 1),
              padding: EdgeInsets.only(top: 50.0), // 50.0 if appbar is given else it'll be 20.0
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Transform.rotate(
                          angle: getRadianFromDegree(270.0),
                          child: Text(
                            "Insects",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                letterSpacing: 0.5,
                                color: _selectedIndex == 0
                                    ? Colors.black
                                    : Colors.grey[500]),
                          ),
                        ),
                        _selectedIndex == 0
                            ? Padding(
                                padding: EdgeInsets.only(left: 35.0),
                                child: Container(
                                  height: 18.0,
                                  width: 4.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 65.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Transform.rotate(
                          angle: getRadianFromDegree(270.0),
                          child: Text(
                            "Articles",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                letterSpacing: 0.5,
                                color: _selectedIndex == 1
                                    ? Colors.black
                                    : Colors.grey[500]),
                          ),
                        ),
                        _selectedIndex == 1
                            ? Padding(
                                padding: EdgeInsets.only(left: 35.0),
                                child: Container(
                                  height: 18.0,
                                  width: 4.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              // NavigationRail(
              //   backgroundColor: Color.fromRGBO(212, 248, 222, 1),
              //   labelType: NavigationRailLabelType.none,
              //   selectedIndex: _selectedIndex,
              //   onDestinationSelected: (index) {
              //     setState(() {
              //       _selectedIndex = index;
              //     });
              //   },
              //   destinations: [
              //     NavigationRailDestination(
              //       icon: Transform.rotate(
              //         angle: getRadianFromDegree(270.0),
              //         child: Text("Insects", style: TextStyle(
              //           fontSize: 17.0,
              //           fontWeight: FontWeight.bold,
              //           fontFamily: "Poppins",
              //           letterSpacing: 0.5,
              //           color: _selectedIndex == 0 ? Colors.black : Colors.grey[800]
              //         ),),
              //       ),
              //       label: Text("Insects for ecosystem"),
              //     ),
              //     NavigationRailDestination(
              //       icon: Transform.rotate(
              //         angle: getRadianFromDegree(270.0),
              //         child: Text("Articles", style: TextStyle(
              //           fontSize: 17.0,
              //           fontWeight: FontWeight.bold,
              //           fontFamily: "Poppins",
              //           letterSpacing: 0.5,
              //           color: _selectedIndex == 1 ? Colors.black : Colors.grey[800]
              //         ),),
              //       ),
              //       label: Text("Insects for ecosystem"),
              //     ),
              //   ],
              // ),
            ),
            Expanded(
              child: Container(
                child: _navigationScreens.elementAt(_selectedIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
