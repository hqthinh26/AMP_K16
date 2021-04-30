import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './CourseCategory.dart';
import './Carousel/MinimizeItem.dart';
import 'package:online_course/containers/CourseContainer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void onTapInkWell() {
    print("I am doing something");
  }

  CourseContainer courseContainer =
      CourseContainer(<String, dynamic>{"title": "override"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("HOME"),
        //automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: CourseCategory(),
      ),
      body: Container(
          //color: Colors.black,
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.width / 3),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: InkWell(
                          onTap: onTapInkWell,
                          child: MinimizeItem(
                            courseContainer: courseContainer,
                          )),
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      )),
    );
  }
}
