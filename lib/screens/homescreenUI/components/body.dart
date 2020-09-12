import 'package:flutter/material.dart';
import 'package:quotidian/screens/homescreenUI/components/navigation.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigation(),
    );
  }
}
