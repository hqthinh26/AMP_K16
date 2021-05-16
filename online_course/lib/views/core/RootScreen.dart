import 'package:flutter/material.dart';
import './Account.dart';
import './Home/Home.dart';
import "./Search/Search.dart";
import "package:shared_preferences/shared_preferences.dart";

class RootScreen extends StatefulWidget {

  final int initIndex;

  RootScreen({this.initIndex = 0});

  @override
  _RootScreenState createState() => _RootScreenState(this.initIndex);
}

class _RootScreenState extends State<RootScreen> {

  int _currentIndex;

  _RootScreenState(this._currentIndex);

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("token")) {
      return prefs.getString("token") is String ? true : false;
    }
    return false;
  }

  Future<void> handleTapBottomItem(int tappedIndex) async {
    tappedIndex == 4 && !await this.hasToken()
        ? Navigator.pushNamed(context, "/sign_in")
        : setState(() => {_currentIndex = tappedIndex});
  }

  List<Widget> mainScreens = <Widget>[
    Home(),
    Search(),
    Center(child: Text("My Courses")),
    Center(child: Text("Wishlist")),
    Account(),
  ];

  List<BottomNavigationBarItem> navigationBarIcons = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.star_border_rounded),
        label: "Home",
        activeIcon: Icon(Icons.star_rounded)),
    BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: "Search",
        activeIcon: Icon(Icons.search_rounded)),
    BottomNavigationBarItem(
        icon: Icon(Icons.play_circle_outline),
        label: "My Courses",
        activeIcon: Icon(Icons.play_circle_fill)),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined),
        label: "Wishlist",
        activeIcon: Icon(Icons.favorite)),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: "Account",
        activeIcon: Icon(Icons.account_circle_rounded))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(child: mainScreens[_currentIndex]),
      ),
      bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey[800],
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: SizedBox(
            height: 90,
            child: new BottomNavigationBar(
              items: navigationBarIcons,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[800],
              currentIndex: _currentIndex,
              selectedItemColor: Colors.blueAccent,
              selectedIconTheme: IconThemeData(color: Colors.blueAccent),
              selectedFontSize: 12,
              unselectedItemColor: Colors.white,
              unselectedIconTheme: IconThemeData(color: Colors.white),
              unselectedFontSize: 12,
              showUnselectedLabels: true,
              onTap: handleTapBottomItem,
            ),
          )),
    );
  }
}
