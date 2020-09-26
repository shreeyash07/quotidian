import 'package:flutter/material.dart';
import 'package:quotidian/screens/homescreenUI/components/categories.dart';
import 'package:quotidian/screens/homescreenUI/fragments/news.dart';
import 'package:quotidian/screens/homescreenUI/fragments/user.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Categories(),
    News(),
    User(),
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
              color: Colors.deepOrangeAccent,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: Colors.deepOrangeAccent,
            ),
            title: Text("News"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.deepOrangeAccent,
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
