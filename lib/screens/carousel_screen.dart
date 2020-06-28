import 'package:ecofriendlyinsects/widgets/single_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselScreen extends StatefulWidget {
  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  CarouselSlider carouselSlider;

  int currentIndex = 0;

  List<CardItem> items = [
    CardItem(
      imageUrl: "assets/airpods_pro.png",
      title: "Bee",
      description:
          "Description description description description description description description",
    ),
    CardItem(
      imageUrl: "assets/airpods_pro.png",
      title: "Bee",
      description:
          "Description description description description description description description",
    ),
    CardItem(
      imageUrl: "assets/airpods_pro.png",
      title: "Bee",
      description:
          "Description description description description description description description",
    ),
    CardItem(
      imageUrl: "assets/airpods_pro.png",
      title: "Bee",
      description:
          "Description description description description description description description",
    ),
    CardItem(
      imageUrl: "assets/airpods_pro.png",
      title: "Bee",
      description:
          "Description description description description description description description",
    ),
    CardItem(
      imageUrl: "assets/airpods_pro.png",
      title: "Bee",
      description:
          "Description description description description description description description",
    ),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(25.0, 15.0, 15.0, 15.0), // top will be 15.0 if appbar is given else it should be 45.0
            child: Text(
              "Insects for Ecosystem",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Expanded(
            child: CarouselSlider(
              height: 400.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 7),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: items
                  .map(
                    (item) => Builder(builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        child: SingleCard(
                          imageUrl: item.imageUrl,
                          title: item.title,
                          description: item.description,
                        ),
                      );
                    }),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(items, (index, color) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        currentIndex == index ? Colors.redAccent : Colors.green,
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class CardItem {
  final String imageUrl;
  final String title;
  final String description;

  CardItem({this.imageUrl, this.title, this.description});
}
