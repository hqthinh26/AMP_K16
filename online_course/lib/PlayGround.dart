import "package:flutter/material.dart";
import "package:online_course/services/User.dart";

class PlayGround extends StatefulWidget {
  @override
  _PlayGroundState createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  Future<void> getUserInfo() async {
    User user = User();

    Map<String, dynamic> userInfo = await user.getUserInfo();
    print(userInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Play Ground"),
          backgroundColor: Colors.grey[800],
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  child: Text("Show user info"), onPressed: getUserInfo),
            ],
          ),
        ));
  }
}
