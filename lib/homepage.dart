import 'package:coronastats2020/screens/global_screen.dart';
import 'package:coronastats2020/screens/placeholder_widget.dart';
import 'package:coronastats2020/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  List<Widget> _children;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    _children = [
      GlobalScreen(key: PageStorageKey("GlobalScreen")),
      SecondPage(
        key: PageStorageKey("secondpage"),
      ),
      //PlaceholderWidget(Colors.lightBlueAccent),
      PlaceholderWidget(Colors.blue)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Corona Stats 2020",
          style: TextStyle(color: Colors.black54),
        )),
      ),
      body: PageStorage(
        child: _children[_currentIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Color.fromARGB(10, 0, 0, 0),
          buttonBackgroundColor: Colors.white,
          //Bottom Nav Bar Color
          height: 64,
          index: _currentIndex,
          items: <Widget>[
            Icon(Icons.home, size: 20, color: Colors.black54),
            Icon(Icons.list, size: 20, color: Colors.black54),
            Icon(Icons.help, size: 20, color: Colors.black54),
          ],
          onTap: onTabTapped,
          animationDuration: Duration(milliseconds: 150),
          animationCurve: Curves.easeIn),
    );
  }

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
