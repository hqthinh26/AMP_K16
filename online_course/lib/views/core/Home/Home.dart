import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './CourseCategory.dart';
import 'package:online_course/containers/CourseContainer.dart';
import 'package:online_course/services/Course.dart';

import './Carousel/MinimizeItem.dart';
import "./Carousel/FullItem.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Iterable<CourseContainer> topNew =
  //     List<CourseContainer>.filled(10, CourseContainer({}));
  //  Iterable<CourseContainer> topRate =
  //   List<CourseContainer>.filled(10, CourseContainer({}));
  // Iterable<CourseContainer> topSell =
  //   List<CourseContainer>.filled(10, CourseContainer({}));


  // Iterable<CourseContainer> topNew = <CourseContainer>[];
  // Iterable<CourseContainer> topSell = <CourseContainer>[];
  // Iterable<CourseContainer> topRate = <CourseContainer>[];


  Iterable<CourseContainer> topNew =
      Iterable<CourseContainer>.generate(10, (int) => CourseContainer({}));

  Iterable<CourseContainer> topRate =
      Iterable<CourseContainer>.generate(10, (int) => CourseContainer({}));

  Iterable<CourseContainer> topSell =
      Iterable<CourseContainer>.generate(10, (int) => CourseContainer({}));


  @override
  void initState() {
    super.initState();
    this.getThreeTypeOfCourses();
  }

  Future<void> getThreeTypeOfCourses() async {
    Course course = Course();

    Iterable<CourseContainer> topNewCourses =
        await course.topNew(page: 1, limit: 10);

    Iterable<CourseContainer> topSellCourses =
        await course.topSell(page: 1, limit: 10);

    Iterable<CourseContainer> topRateCourses =
        await course.topRate(page: 1, limit: 10);

    setState(() {
      topNew = topNewCourses;
      topSell = topSellCourses;
      topRate = topRateCourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("HOME"),
        //automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: CourseCategory(),
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
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
                    "Các khoá học bán chạy nhất", //Top Sell
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        //fontStyle: FontStyle.italic,
                        //fontFamily: "Fira"
                        ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.width / 1.5,
                        aspectRatio: 16 / 9,
                        // autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 2),
                      ),
                      items: this.topSell.map((course) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                              child: InkWell(
                                child: MinimizeItem(
                                  courseContainer: course,
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FullItem(
                                              courseContainer: course)));
                                },
                              ),
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
                  //SizedBox(height: 20),
                  Text(
                    "Các khoá học mới nhất", //top-new
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        //fontStyle: FontStyle.italic,
                        //fontFamily: "Fira"
                        ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.width / 1.5,
                        aspectRatio: 16 / 9,
                        // autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 4),
                      ),
                      items: this.topNew.map((course) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.black),
                              child: InkWell(
                                  child: MinimizeItem(
                                    courseContainer: course,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FullItem(
                                                courseContainer: course)));
                                  }),
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
                  //SizedBox(height: 20),
                  Text(
                    "Các khoá học đánh giá cao nhất",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        //fontStyle: FontStyle.italic,
                        //fontFamily: "Fira"
                        ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.width / 1.5,
                        aspectRatio: 16 / 9,
                        // autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 6),
                      ),
                      items: this.topRate.map((course) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.black),
                              child: InkWell(
                                  child: MinimizeItem(
                                    courseContainer: course,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FullItem(
                                                courseContainer: course)));
                                  }),
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
