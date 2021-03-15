import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: Text(
                "Email or Username",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white54),
              ),
            ),
            TextField(
                style: TextStyle(color: Colors.white),
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle, color: Colors.white),
                  fillColor: Colors.grey[800],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),

                  // hintText: "Tên tài khoản",
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white54),
              ),
            ),
            TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.grey[800],
                  filled: true,
                  prefixIcon:
                      Icon(Icons.remove_red_eye_sharp, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[800]),
                    borderRadius: BorderRadius.circular(5),
                  ),

                  // hintText: "Tên tài khoản",
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: ElevatedButton(
                    onPressed: () => {Navigator.pushNamed(context, "/home")},
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: TextButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, "/helper")},
                      child: Text("Need help?"),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.blue),
                        primary: Colors.black),
                    child: Text("Use Single Sign-On (SSO)",
                        style: TextStyle(color: Colors.blue)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.blue),
                        primary: Colors.black),
                    child: Text(
                      "Subcribe to Pluralsight",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
