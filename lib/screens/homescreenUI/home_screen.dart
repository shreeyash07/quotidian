import 'package:flutter/material.dart';

import 'components/Body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/Home_Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Body(),
    );
  }
}
