import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_course/services/Category.dart';
import 'package:online_course/services/Course.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> getAllCategories() async {
    try {
      Category sample = Category();
      List<dynamic> response = await sample.getAllCategories();
      print(response);
    } catch (e) {
      print('this is error: $e');
    }
  }

  Future<void> getCourseTopSell({limit, page}) async {
    try {
      Course course = Course();
      List<dynamic> payload = await course.topSell(limit: limit, page: page);
      print('this is course payload: $payload');
    } on DioError catch (e) {
      print('error happens $e');
    }
  }

  Future<void> getCourseTopRate({limit, page}) async {
    try {
      Course course = Course();
      List<dynamic> payload = await course.topRate(limit: limit, page: page);
      print('this is topRate: $payload');
    } on DioError catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("HOME"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          color: Colors.black,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  child: Text("Click me"),
                  onPressed: () {
                    getCourseTopRate(limit: 10, page: 1);
                  },
                )
              ],
            ),
          )),
    );
  }
}
