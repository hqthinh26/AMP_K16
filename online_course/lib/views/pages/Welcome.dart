import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_box,
                color: Colors.redAccent,
                size: 60,
                textDirection: TextDirection.ltr,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                child: Text("PLURALSIGHT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, "/sign_in")},
                      style: ButtonStyle(),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 1, color: Colors.blue),
                          primary: Colors.black),
                      child: Text(
                        "Subscribe to Plural Sight",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.blue),
                        primary: Colors.black,
                      ),
                      child: Text("Explore without a subscription",
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              )
            ],
          )),
        ));
  }
}
