import 'package:flutter/material.dart';
import 'package:online_course/services/User.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  dynamic usernameController = TextEditingController();
  dynamic emailController = TextEditingController();
  dynamic phoneNumberController = TextEditingController();
  dynamic passwordController = TextEditingController();

  Future<void> onRegister(BuildContext context) async {
    User registerUser = User.register(
        username: usernameController.text,
        email: emailController.text,
        phone: phoneNumberController.text,
        password: passwordController.text);
    print(
        'input ${usernameController.text} - ${emailController.text} - ${phoneNumberController.text} - ${passwordController.text}');
    await registerUser.register(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTER", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
      ),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                  //color: Colors.,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Chào mừng bạn đến với Online Course - K16",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                            child: TextField(
                                controller: usernameController,
                                style: TextStyle(color: Colors.black),
                                autofocus: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle,
                                      color: Colors.green),
                                  fillColor: Colors.white10,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ))),
                      ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                          child: TextField(
                              controller: emailController,
                              style: TextStyle(color: Colors.black),
                              autofocus: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle,
                                    color: Colors.green),
                                fillColor: Colors.white10,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                        ),
                      ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                          child: TextField(
                              controller: phoneNumberController,
                              style: TextStyle(color: Colors.black),
                              autofocus: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle,
                                    color: Colors.green),
                                fillColor: Colors.white10,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                        ),
                      ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 10.0),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                          child: TextField(
                              controller: passwordController,
                              style: TextStyle(color: Colors.black),
                              autofocus: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle,
                                    color: Colors.green),
                                fillColor: Colors.white10,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                        ),
                      ]),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
                              child: ElevatedButton(
                                onPressed: () =>
                                    {Navigator.pushNamed(context, "/sign_in")},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.white,
                                    side: BorderSide(color: Colors.red)),
                                child: Text(
                                  "CANCEL",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 0.0),
                              child: ElevatedButton(
                                onPressed: () => onRegister(context),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  onPrimary: Colors.green,
                                  side: BorderSide(color: Colors.green),
                                ),
                                // () => {Navigator.pushNamed(context, "/home")},
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ],
          ))),
    );
  }
}
