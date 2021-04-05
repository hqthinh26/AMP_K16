import 'package:flutter/material.dart';
import 'package:online_course/services/User.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Future<void> onRegister() async {
    User registerUser = User.register(
        username: 'hqthinh - Advanced Mobile Programming',
        email: 'quocthinh1998199819988@gmail.com',
        phone: '0967897422',
        password: 'quocthinh1998');
    int value = await registerUser.register();
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN UP"),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
          color: Colors.black,
          padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
          child: SafeArea(child: Column())),
    );
  }
}
