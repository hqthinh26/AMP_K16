import 'package:flutter/material.dart';
import 'package:online_course/services/User.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  dynamic emailController = TextEditingController();
  dynamic passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> onLogin() async {
      User loginUser = User.login(
          email: emailController.text, password: passwordController.text);

      bool status = await loginUser.login(context);
      if (status) {
        //Navigator.pushNamed(context, '/root_screen');
        Navigator.pushNamed(
          context,
          '/root_screen',
        );
      }
    }

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
            //Nhập tài khoản
            TextField(
                controller: emailController,
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
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white54),
              ),
            ),
            //Nhập mật khẩu
            TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.grey[800],
                  filled: true,
                  prefixIcon:
                      Icon(Icons.remove_red_eye_sharp, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),

                  // hintText: "Tên tài khoản",
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Nút đăng nhập
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: ElevatedButton(
                    onPressed: () => onLogin(),
                    // () =>
                    //     {Navigator.pushNamed(context, '/root_screen')},
                    // () => {Navigator.pushNamed(context, "/home")},
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                //Nút tạo tài khoản mới
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/register'),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.green),
                        primary: Colors.green),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                //Nút cần giúp đỡ
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
