import 'package:flutter/material.dart';
import 'package:online_course/views/pages/SignIn.dart';
import 'package:online_course/views/pages/Welcome.dart';
import 'package:online_course/views/pages/Helper.dart';
import 'package:online_course/views/user/Home.dart';
import 'package:online_course/views/user/Register.dart';

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
      '/register': (context) => Register(),
    });
  }
}
