import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './CourseCategory.dart';
import './Carousel/MinimizeItem.dart';
import 'package:online_course/containers/CourseContainer.dart';
import 'package:online_course/services/Course.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Iterable<CourseContainer> topNew = <CourseContainer>[];
  Iterable<CourseContainer> topSell = <CourseContainer>[];
  Iterable<CourseContainer> topRate = <CourseContainer>[];

  void onTapInkWell() {
    print("I am doing something");
  }

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
                    "Các khoá học bán chạy nhất", //Top Sell
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
                      items: this.topSell.map((course) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.blue),
                              // child: MinimizeItem(
                              //   courseContainer: course,
                              // ),
                              child: InkWell(
                                  onTap: onTapInkWell,
                                  child: MinimizeItem(
                                    courseContainer: course,
                                  )),
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
                    "Các khoá học mới nhất", //top-new
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
                      items: this.topNew.map((course) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.blue),
                              // child: MinimizeItem(
                              //   courseContainer: course,
                              // ),
                              child: InkWell(
                                  onTap: onTapInkWell,
                                  child: MinimizeItem(
                                    courseContainer: course,
                                  )),
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
                      items: this.topRate.map((course) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width / (1.3),
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(color: Colors.blue),
                              // child: MinimizeItem(
                              //   courseContainer: course,
                              // ),
                              child: InkWell(
                                  onTap: onTapInkWell,
                                  child: MinimizeItem(
                                    courseContainer: course,
                                  )),
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
