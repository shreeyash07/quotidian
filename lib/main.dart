import 'package:flutter/material.dart';
import 'package:quotidian/widgets/transaction.dart';

void main() => runApp(Quotidian());

class Quotidian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.purple,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
              button: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

