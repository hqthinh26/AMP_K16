import 'package:dio/dio.dart';
import "package:flutter/material.dart";

import "package:online_course/services/Course.dart";
import "package:online_course/services/User.dart";

import "package:online_course/containers/CourseContainer.dart";
import "package:online_course/containers/UserCourseContainer.dart";

import "package:online_course/views/core/Search/MinimizedSearchItem.dart";
import "package:online_course/views/core/Home/Carousel/FullItem.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  dynamic searchController = TextEditingController();
  Iterable<UserCourseContainer> userFavoritesCourses = <UserCourseContainer>[];
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

    print("&&&&&&&&&&&");
    print(courseContainer);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FullItem(courseContainer: courseContainer)));
  }

  Future<void> getUserFavoriteCoures() async {
    try {
      User user = User();
      Iterable<dynamic> payload = await user.getFavoriteCourses();

      if (payload.length == 0) return;

      setState(() {
        loading = false;
        userFavoritesCourses =
            payload.map((item) => UserCourseContainer(courseInfo: item));
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserFavoriteCoures();
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
                          Text("Wishlist",
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
            this.userFavoritesCourses.length == 0
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
                      itemCount: this.userFavoritesCourses.length,
                      itemBuilder: (BuildContext _, int index) {
                        return InkWell(
                          child: MinimizedSearchItem(
                            courseContainer: this
                                .userFavoritesCourses
                                .elementAt(index)
                                .toCourseContainerObject(),
                          ),
                          onTap: () => {
                            this.getCourseInfo(
                                context: context,
                                courseId: this
                                    .userFavoritesCourses
                                    .elementAt(index)
                                    .id)
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
