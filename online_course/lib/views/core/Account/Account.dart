import "package:flutter/material.dart";

import "package:online_course/services/User.dart";
import "package:online_course/containers/UserContainer.dart";
import "./UpdateAccount.dart";
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

  Future<void> refreshOnBack() async {
    bool shouldReload = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => UpdateAccount(userContainer)));

    shouldReload ? await initAccountSreen() : print("no need to reload");
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
            padding: EdgeInsets.only(left: 15, right: 15),
            color: Colors.black,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            '${this.userContainer.avatar}',
                            //'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
                            height: 240.0,
                            width: 160.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Giới thiệu",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            TextButton(
                              onPressed: () => refreshOnBack(),
                              child: Text(
                                "Chỉnh sửa",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "Thành viên ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(this.userContainer.name,
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "Email ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(this.userContainer.email,
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "Điện thoại ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(this.userContainer.phone,
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ]),

                      // Text(this.userContainer.phone,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 16,
                      //     )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          TextButton(
                            onPressed: logOutAction,
                            child: Text(
                              "Đăng xuất",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              //onPressed: logOutAction,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                  Container(
                      padding: EdgeInsets.only(top: 40),
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
