import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import "package:online_course/services/Course.dart";
import "package:online_course/containers/CourseContainer.dart";
import "./MinimizedSearchItem.dart";
import "package:online_course/views/core/Home/Carousel/FullItem.dart";

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  dynamic searchController = TextEditingController();
  Iterable<CourseContainer> searchedCourses = <CourseContainer>[];

  Future<void> getCourseInfo(
      {required BuildContext context, required String courseId}) async {
    Course course = Course();
    CourseContainer courseContainer = await course.getCourseInfo(courseId);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FullItem(courseContainer: courseContainer)));
  }

  Future<void> getCourses(String keyword) async {
    try {
      Course course = Course();
      Iterable<CourseContainer> searchedCourses =
          await course.searchedCourses(keyword: keyword, limit: 10);

      setState(() {
        this.searchedCourses = searchedCourses;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  //color: Colors.red,
                  padding: EdgeInsets.fromLTRB(20, 0, 10, 8),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 15,
                          child: Container(
                            height: 40,
                            child: TextField(
                                controller: searchController,
                                //autofocus: true,
                                
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                onSubmitted: getCourses,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 0),
                                  hintText: "Từ khoá nổi bật: C++, Java",
                                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14, ),
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.white),
                                  fillColor: Colors.grey[800],
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )),
                          )),
                      Flexible(
                        flex: 2,
                        child: Center(
                            child: Icon(Icons.filter_list, color: Colors.blue)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey[800],
                ),
                this.searchedCourses.length == 0
                    ? Expanded(
                        child: Container(
                          color: Colors.black,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.youtube_searched_for, size: 100, color: Colors.white),
                                Text("Không tìm thấy khoá học",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Fira",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      
                                    )),
                                    SizedBox(height: 10,),
                                Text("Hãy thử từ khoá mới",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Fira"

                                    )),
                              ],
                            )),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: this.searchedCourses.length,
                          itemBuilder: (BuildContext _, int index) {
                            return InkWell(
                              child: MinimizedSearchItem(
                                  courseContainer:
                                      this.searchedCourses.elementAt(index)),
                              onTap: () => {
                                this.getCourseInfo(
                                    context: context,
                                    courseId: this
                                        .searchedCourses
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
            )));
  }
}
