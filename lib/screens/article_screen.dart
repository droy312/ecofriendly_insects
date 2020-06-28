import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String _launchUrl = "https://www.google.com";

  Widget card(String title, String websiteName, String image, String url) {
    return GestureDetector(
      onTap: () {
        _launchInApp(url);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 140,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //border: Border.all(color: Color.fromRGBO(40, 40, 40, 1), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 5.0),
              blurRadius: 10.0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  fontFamily: 'Poppins',
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(image),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                'Article from ' + websiteName,
                style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true,
          forceWebView: true,
          headers: <String, String>{
            'header_key': 'header_value',
          });
    } else {
      throw 'Could not launch $url';
    }
  }

//https://en.wikipedia.org/wiki/Insect_ecology
//https://www.scitecheuropa.eu/ecosystem-services/89862/
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 20.0),
          card('Insect ecology', 'Wikipedia', 'assets/a2.jpg', 'https://en.wikipedia.org/wiki/Insect_ecology'),
          card('How do insects contribute to ecosystem services?', 'Scitech Europa', 'assets/a1.jpg', 'https://www.scitecheuropa.eu/ecosystem-services/89862/'),
        ],
      ),
    );
  }
}
