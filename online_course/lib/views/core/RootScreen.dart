import 'package:flutter/material.dart';
import './Account.dart';
import './Home.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  List<Widget> mainScreens = <Widget>[
    Home(),
    Center(child: Text("DOWNLOAD")),
    Center(child: Text("BROWSE")),
    Center(child: Text("SEARCH")),
    Account(),
  ];

  List<BottomNavigationBarItem> navigationBarIcons = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.download_done_sharp), label: "Downloads"),
    BottomNavigationBarItem(
        icon: Icon(Icons.stacked_bar_chart), label: "Browse"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_sharp), label: "Account")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[800],
        child: SafeArea(child: mainScreens[_currentIndex]),
      ),
      bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey[800],
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: new BottomNavigationBar(
            items: navigationBarIcons,
            backgroundColor: Colors.grey[800],
            currentIndex: _currentIndex,
            selectedItemColor: Colors.blueAccent,
            onTap: (tappedIndex) => {
              setState(() => {_currentIndex = tappedIndex})
            },
          )),
    );
  }
}
