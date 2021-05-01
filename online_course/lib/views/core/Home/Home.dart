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

  CourseContainer courseContainer = CourseContainer(<String, dynamic>{
    "title": "overrideoverrideoverrideoverrideoverrideoverride"
  });

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
      body: SingleChildScrollView(
          //color: Colors.black,
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Các khoá học bán chạy nhất",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.width / 2,
                        aspectRatio: 16 / 9,
                        // autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 2),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.blue),
                              child: MinimizeItem(
                                courseContainer: courseContainer,
                              ),
                              // child: InkWell(
                              //     onTap: onTapInkWell,
                              //     child: MinimizeItem(
                              //       courseContainer: courseContainer,
                              //     )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Divider(
                    thickness: 5,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Các khoá học mới nhất",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.width / 2,
                        aspectRatio: 16 / 9,
                        // autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 2),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.blue),
                              child: MinimizeItem(
                                courseContainer: courseContainer,
                              ),
                              // child: InkWell(
                              //     onTap: onTapInkWell,
                              //     child: MinimizeItem(
                              //       courseContainer: courseContainer,
                              //     )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Divider(
                    thickness: 5,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Các khoá học đánh giá cao nhất",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.width / 2,
                        aspectRatio: 16 / 9,
                        // autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 2),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.blue),
                              child: MinimizeItem(
                                courseContainer: courseContainer,
                              ),
                              // child: InkWell(
                              //     onTap: onTapInkWell,
                              //     child: MinimizeItem(
                              //       courseContainer: courseContainer,
                              //     )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
