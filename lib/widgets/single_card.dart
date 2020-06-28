import 'package:ecofriendlyinsects/screens/insect_detail_screen.dart';
import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  SingleCard({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[50],
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image(image: AssetImage(imageUrl), height: 150.0, width: 150.0,),
                  ),
                  Positioned(
                    bottom: 25.0,
                    left: 25.0,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Container(

              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
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
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsectDetailScreen(
                          imageUrl: imageUrl,
                          title: title,
                          description: description,
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
    );
  }
}
