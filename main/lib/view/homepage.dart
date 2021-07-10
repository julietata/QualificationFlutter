import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:main/models/location.dart';
import 'package:main/utils/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var _index = 0;
  var _images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.darkThemeEnabled? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
          appBar: AppBar(
                actions: [
                  PopupMenuButton(itemBuilder: (context) {
                    return ['Toggle Theme'].map((e) {
                      return PopupMenuItem(
                          child: TextButton(
                        child: Text('Toggle Theme'),
                        onPressed: () {
                          setState(() {
                            globals.darkThemeEnabled = !globals.darkThemeEnabled;
                          });
                        },
                      ));
                    }).toList();
                  })
                ],
                backgroundColor: Colors.pink,
              ),
          body: Column(children: [
        CarouselSlider(
            items: [
              Image(
                image: AssetImage(_images[0]),
              ),
              Image(
                image: AssetImage(_images[1]),
              ),
              Image(
                image: AssetImage(_images[2]),
              ),
              Image(
                image: AssetImage(_images[3]),
              ),
            ],
            options: CarouselOptions(
                initialPage: 0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3)
              )
            ),
            Container(child: Text('geLAto is a famous ice cream store in town.'), padding: const EdgeInsets.all(20),)
          ]
        )
      ),
    );
  }
}
