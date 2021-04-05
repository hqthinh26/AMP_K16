import 'package:flutter/material.dart';
// import 'package:online_course/services/User.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Future<void> onRegister() async {
  //   User registerUser = User.register(
  //       username: 'hqthinh - Advanced Mobile Programming',
  //       email: 'quocthinh1998199819988@gmail.com',
  //       phone: '0967897422',
  //       password: 'quocthinh1998');
  //   int value = await registerUser.register();
  //   print(value);
  // }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("ĐĂNG KÝ"),
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
              Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                  color: Colors.red,
                  child: SizedBox(
                    width: double.infinity,
                    height: queryData.size.height * 0.1,
                    child: Text("hello world"),
                  )),
            ],
          ))),
    );
  }
}
