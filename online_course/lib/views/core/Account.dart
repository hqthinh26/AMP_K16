import "package:flutter/material.dart";

import "package:online_course/services/User.dart";
import "package:online_course/containers/UserContainer.dart";
import "package:shared_preferences/shared_preferences.dart";

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  UserContainer userContainer = UserContainer({"favoriteCategories": []});

  Future<void> initAccountSreen() async {
    User user = User();

    Map<String, dynamic> result = await user.getUserInfo();
    UserContainer data = UserContainer(result);
    setState(() => userContainer = data);
  }

  Future<void> logOutAction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("token")) {
      prefs.remove("token");
    }
    Navigator.pushNamed(context, '/root_screen');
  }

  @override
  void initState() {
    super.initState();
    this.initAccountSreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Account"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.black,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      child: Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            '${this.userContainer.avatar}',
                            //'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
                            height: 240.0,
                            width: 160.0,
                          ),
                        ),
                        Text(this.userContainer.id,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        Text(this.userContainer.email,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        ElevatedButton(
                          child: Text("Đăng xuất"),
                          onPressed: logOutAction,
                        )
                      ],
                    ),
                  )),
                  Container(
                      padding: EdgeInsets.only(top: 40, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Interests",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 5,
                            children: this
                                .userContainer
                                .favoriteCategories
                                .map((item) {
                              return Chip(
                                backgroundColor: Colors.grey[400],
                                avatar:
                                    Icon(Icons.check_circle, color: Colors.red),
                                label: Text(item),
                              );
                            }).toList(),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25),
                            child: Text("Activity Insights (last 30 days)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25),
                            child: Text("TOTAL ACTIVE DAYS",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Text("41 day streak",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25),
                            child: Text("MOST ACTIVE TIME OF DAY",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("21:00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("MOST VIEWED SUBJECT",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Managerial Skills",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                )),
                          )
                        ],
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
