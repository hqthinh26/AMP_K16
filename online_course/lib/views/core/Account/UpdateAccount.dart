import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:online_course/containers/UserContainer.dart';
import "package:online_course/services/User.dart";

class UpdateAccount extends StatefulWidget {
  late final UserContainer userContainer;

  UpdateAccount(this.userContainer);
  @override
  _UpdateAccountState createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      nameController = TextEditingController(text: widget.userContainer.name);
      phoneController = TextEditingController(text: widget.userContainer.phone);
    });
  }

  void backWithoutReload() {
    Navigator.pop(context, false);
  }

  void backWithReload() {
    Navigator.pop(context, true);
  }

  Future<void> updateUserInfo() async {
    try {
      User user = User();

      bool status = await user.updateUserProfile(
          name: nameController.text,
          avatar: widget.userContainer.avatar,
          phone: phoneController.text);

      status
          ? backWithReload()
          : print("Cap Nhat Thong Tin Nguoi Dung That Bai");
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cập nhật thông tin tài khoản !!!",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          '${widget.userContainer.avatar}',
                          //'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
                          height: 240.0,
                          width: 160.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 25,
                      child: Text(
                        "Tên người dùng",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: nameController,
                        style: TextStyle(color: Colors.white),
                        autofocus: true,
                        decoration: InputDecoration(
                            fillColor: Colors.black87,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 10,
                                  style: BorderStyle.solid),
                              gapPadding: 0,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 25,
                      child: Text(
                        "Số điện thoại",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: phoneController,
                        style: TextStyle(color: Colors.white),
                        autofocus: true,
                        decoration: InputDecoration(
                            //fillColor: Colors.grey,
                            //filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OutlinedButton(
                              child: Text(
                                "Huỷ bỏ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                  primary: Colors.red,
                                  side:
                                      BorderSide(color: Colors.blue, width: 2)),
                              onPressed: backWithoutReload),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                          ),
                          ElevatedButton(
                            child: Text("Cập nhật",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            onPressed: updateUserInfo,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class FlexLit {}
