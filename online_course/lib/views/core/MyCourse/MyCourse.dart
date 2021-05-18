import 'package:dio/dio.dart';
import "package:flutter/material.dart";

import "package:online_course/services/Course.dart";
import "package:online_course/services/User.dart";

import "package:online_course/containers/CourseContainer.dart";
import "package:online_course/containers/UserCourseContainer.dart";

import "package:online_course/views/core/Search/MinimizedSearchItem.dart";
import "package:online_course/views/core/Home/Carousel/FullItem.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  dynamic searchController = TextEditingController();
  Iterable<UserCourseContainer> userProcessCourses = <UserCourseContainer>[];
  bool loading = true;

  final spinkit = Container(
    color: Colors.black,
    child: SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      },
    ),
  );

  Future<void> getCourseInfo(
      {required BuildContext context, required String courseId}) async {
    Course course = Course();
    CourseContainer courseContainer = await course.getCourseInfo(courseId);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FullItem(courseContainer: courseContainer)));
  }

  Future<void> getUserProcessCoures() async {
    try {
      User user = User();
      Iterable<dynamic> payload = await user.getProcessCourses(); 
      loading = false;

      if (payload.length == 0) return;

      setState(() {
        userProcessCourses =
            payload.map((item) => UserCourseContainer(courseInfo: item));
      });
    } on DioError catch (e) {
      loading = false;
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserProcessCoures();
  }

  @override
  Widget build(BuildContext context) {
    var container = Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              padding: EdgeInsets.fromLTRB(20, 0, 10, 8),
              child: Row(
                children: [
                  Expanded(
                      flex: 15,
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("My courses",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ))),
                  Expanded(
                    flex: 2,
                    child: Center(
                        child: Icon(Icons.filter_list, color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[850],
            ),
            this.userProcessCourses.length == 0
                ? Expanded(
                    child: Container(
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.youtube_searched_for,
                                size: 100, color: Colors.white),
                            Text("Bạn chưa có sở hữu khoá học nào",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Fira",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                )),
                          ],
                        )),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: this.userProcessCourses.length,
                      itemBuilder: (BuildContext _, int index) {
                        return InkWell(
                          child: MinimizedSearchItem(
                            courseContainer: this
                                .userProcessCourses
                                .elementAt(index)
                                .toCourseContainerObject(),
                            courseOwned: true,
                          ),
                          onTap: () => {
                            this.getCourseInfo(
                                context: context,
                                courseId:
                                    this.userProcessCourses.elementAt(index).id)
                          },
                        );
                      },
                    ),
                  )

            // ElevatedButton(
            //   child: Text("click me"),
            //   onPressed: () => {getCourses()},
            // )
          ],
        ));
    return Scaffold(body: loading ? spinkit : container);
  }
}
