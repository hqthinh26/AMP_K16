import 'package:flutter/material.dart';

class Helper extends StatefulWidget {
  @override
  _HelperState createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  List<String> helperTexts = [
    "Forgot your password?",
    "Subscribe to PluralSight",
    "Restore subscription with iTunes",
    "Contact Plural support",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Helper"),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        color: Colors.black,
        child: SafeArea(
            child: ListView.builder(
                itemCount: helperTexts.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(helperTexts[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              TextButton(
                                onPressed: () => {},
                                child: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.grey[800]),
                              )
                            ],
                          )));
                })),
      ),
    );
  }
}
