import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import "package:online_course/services/Course.dart";
import "package:online_course/containers/CourseContainer.dart";
import "./MinimizedSearchItem.dart";

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  dynamic searchController = TextEditingController();
  Iterable<CourseContainer> searchedCourses = <CourseContainer> [];

  Future<void> getCourses(String keyword) async {
    try {
      Course course = Course();
      Iterable<CourseContainer> searchedCourses = await course.searchedCourses(keyword: keyword, limit: 10);

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
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                onSubmitted: getCourses,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 0),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: this.searchedCourses.length,
                    itemBuilder: (BuildContext _, int index) => MinimizedSearchItem(courseContainer: this.searchedCourses.elementAt(index))), 
                )

                // ElevatedButton(
                //   child: Text("click me"),
                //   onPressed: () => {getCourses()},
                // )
              ],
            )));
  }
}
