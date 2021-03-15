import 'package:flutter/material.dart';
import 'package:online_course/pages/SignIn.dart';
import 'package:online_course/pages/Welcome.dart';
import 'package:online_course/pages/Helper.dart';
import 'package:online_course/user/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Welcome(),
      '/sign_in': (context) => SignIn(),
      '/helper': (context) => Helper(),
      '/home': (context) => Home(),
    });
  }
}
