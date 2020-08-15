import 'package:flutter/material.dart';
import 'package:quotidian/routes.dart';
import 'package:quotidian/screens/splash/splash_screen.dart';
import 'package:quotidian/widgets/main_page.dart';
import './constants.dart';
import 'package:quotidian/widgets/note.dart';
import 'package:quotidian/widgets/transaction.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(Quotidian());

class Quotidian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      //home: SplashScreen(),
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: qTextColor),
          bodyText2: TextStyle(color: qTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
