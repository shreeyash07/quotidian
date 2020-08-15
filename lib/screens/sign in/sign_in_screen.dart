import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/body.dart';

class MyHomePage extends StatelessWidget {
  static String routeName = "/sign_in";
  @Override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
