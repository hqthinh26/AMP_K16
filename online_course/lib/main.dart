import 'package:flutter/material.dart';

import 'package:online_course/views/pages/Welcome.dart';
import 'package:online_course/views/pages/Helper.dart';

import 'package:online_course/views/user/SignIn.dart';
import 'package:online_course/views/user/Register.dart';

import 'package:online_course/views/core/RootScreen.dart';
import 'package:online_course/views/core/Home.dart';

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
      '/register': (context) => Register(),
      '/root_screen': (context) => RootScreen(),
      '/home': (context) => Home(),
    });
  }
}
