import 'package:flutter/material.dart';
import 'package:online_course/services/Category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> getAllCategories() async {
    try {
      Category sample = Category();
      dynamic response = await sample.getAllCategories();
      print(response);
    } catch (e) {
      print('this is error: $e');
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
                  onPressed: () => {getAllCategories()},
                )
              ],
            ),
          )),
    );
  }
}
