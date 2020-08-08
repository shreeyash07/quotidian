import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Note"), backgroundColor: Color(x0FF0D47A1)),
        body: new Container(
            child: new Center(
                child: new Column(children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.favorite, color: Colors.redAccent),
              iconSize: 70.0,
              onPressed: null),
          new Text("Note")
        ]))));
  }
}

class Secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Second Page"), backgroundColor: Color(x0FF0D47A1)),
        body: new Container(
            child: new Center(
                child: new Column(children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.home, color: Colors.blue),
              iconSize: 70.0,
              onPressed: null),
          new Text("Second Page")
        ]))));
  }
}
