import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import './CourseCategory.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("HOME"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          //color: Colors.black,
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CourseCategory()
            // CarouselSlider(
            //   options: CarouselOptions(
            //       height: MediaQuery.of(context).size.width / 3),
            //   items: [1, 2, 3, 4, 5].map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //             width: MediaQuery.of(context).size.width,
            //             margin: EdgeInsets.symmetric(horizontal: 5.0),
            //             decoration: BoxDecoration(color: Colors.amber),
            //             child: Text(
            //               'text $i',
            //               style: TextStyle(fontSize: 16.0),
            //             ));
            //       },
            //     );
            //   }).toList(),
            // )
          ],
        ),
      )),
    );
  }
}
