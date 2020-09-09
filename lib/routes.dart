import 'package:flutter/material.dart';
import 'package:quotidian/screens/sign%20in/sign_in_screen.dart';
import 'package:quotidian/screens/sign%20up/sign_up_screen.dart';
import 'package:quotidian/screens/splash/splash_screen.dart';
import 'package:quotidian/widgets/transaction.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MyHomePage.routeName: (context) => MyHomePage(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
};
