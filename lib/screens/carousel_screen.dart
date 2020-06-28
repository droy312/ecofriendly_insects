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
      imageUrl: "assets/bee1.jpg",
      title: "Bee",
      description:
          "It's said that bees contribute more than \$20 billion to the value of crop production in the United States, pollinating plants such as:" +

"\napples" + 
"\ncranberries" +
"\nblueberries"
"\ncherries" +
"\nmelons" +
"\nalmonds" +
"\nbroccoli" +
"\nOf course, they also provide honey in addition to helping to pollinate our plants.",
      header: 'Helpful Honey Bees',
    ),
    CardItem(
      imageUrl: "assets/ladybug1.jpg",
      title: "Ladybug",
      description:
          "One of the most famous of all helpful insects is the lovely ladybug, also known as ladybirds or lady beetles. In fact, these little guys are so revered that even those who are terrified of most insects still find spotted ladybugs to be charming. It's no wonder that aside from their cute looks, they are also great for gardens, and they eat pesky aphids, whiteflies and other insects that destroy plants. In fact, a ladybug can eat up to 5,000 aphids in its lifetime.",
      header: 'Lovely Little Ladybugs',
    ),
    CardItem(
      imageUrl: "assets/mantis1.jpg",
      title: "Mantis",
      description:
          "It's easy to be intimidated by praying mantises given that they look creepy and that you probably know that the females are known to eat the heads off of their mates. That being said, they're actually great garden insects, as they are skilled predators that can instantly snag and kill garden pests such as:" + 

"\ngrubs" +
"\naphids" +
"\ngrasshoppers" +
"\ncrickets" +
"\nflies" +
"\nmore",
      header: 'Proud Praying Mantises',
    ),
    CardItem(
      imageUrl: "assets/lacewing1.jpg",
      title: "Lacewing",
      description:
          "Green lacewings may not be as famous as ladybugs, but they are also great hunters of pests such as aphids, thrips, mealybugs, small caterpillars, mites and whiteflies as well, eating them both as larvae and adults. The mother lacewings lay eggs among the larvae of whitefly and aphid colonies, and the lacewing starts eating these pests from birth. They are aggressive predators, but if you want to help them, it's important to keep ants away from your garden since ants eat the eggs of lacewings.",
      header: 'Great Green Lacewings',
    ),
    CardItem(
      imageUrl: "assets/dragonfly1.jpg",
      title: "Dragonfly",
      description:
          "Dragonflies are like ladybugs in that many insect haters still appreciate their beauty. They are also easy to love because they prey on pesky flying insects including mosquitoes, flies, moths, whiteflies and fruit flies. They also eat the larvae of these creatures, stopping them before they can cause damage.",
      header: 'Beautifully Daring Dragonflies',
    ),
    CardItem(
      imageUrl: "assets/earthworm1.jpg",
      title: "Earthworm",
      description:
          "Yes, earthworms aren't much to look at, but they are incredibly beneficial, improving the soil wherever they go. Their excrement enriches soil and controls its pH. As if that's not enough, their tunnels aerate the dirt, allowing water to reach the roots of plants more easily. The more earthworms there are in soil, the better its quality.",
      header: 'Squirmy Old Earthworms',
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
                          header: item.header,
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
  final String header;

  CardItem({this.imageUrl, this.title, this.description, this.header});
}
