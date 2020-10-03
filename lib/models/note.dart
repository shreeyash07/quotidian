import 'dart:convert';

import 'package:flutter/foundation.dart';

Note noteFromJson(String str) => Note.fromJson(json.decode(str));
String noteToJson(Note data) => json.encode(data.toJson());

class Note {
  String id;
  String title;
  String note;

  Note({
    @required this.id,
    @required this.title,
    @required this.note,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        note: json["note"] as String,
        title: json["title"] as String,
        id: json["id"] as String,
      );

  Map<String, dynamic> toJson() => {
        "note": note,
        "title": title,
        "id": id,
      };
}
