import 'package:flutter/material.dart';
import 'package:quotidian/screens/homescreenUI/components/categories.dart';
import 'package:quotidian/screens/homescreenUI/fragments/news.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Categories(),
    News(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFFFFECDF),
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: Color(0xFFFFECDF),
            ),
            title: Text("News"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Color(0xFFFFECDF),
            ),
            title: Text("User"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFF7643),
        onTap: _onItemTapped,
      ),
    );
  }
}
