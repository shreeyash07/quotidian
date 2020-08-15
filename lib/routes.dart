import 'package:flutter/material.dart';
import 'package:quotidian/screens/splash/splash_screen.dart';
import 'package:quotidian/widgets/transaction.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MyHomePage.routeName: (context) => MyHomePage(),
};