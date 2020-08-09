import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          IconButton(
              icon: new Icon(Icons.note, color: Colors.redAccent),
              iconSize: 70.0,
              onPressed: () {
                Navigator.of(context).pushNamed("/SecondPage");
              }),
          new Text("Note")
        ]))));
  }
}

class Secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.home, color: Colors.blue),
              iconSize: 70.0,
              onPressed: null),
          new Text("Second Page")
        ]))));
  }
}
