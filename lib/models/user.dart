import 'package:flutter/foundation.dart';
import 'dart:convert';

UserModel noteFromJson(String str) => UserModel.fromJson(json.decode(str));
String noteToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String title;
  String note;

  UserModel({
    @required this.id,
    @required this.title,
    @required this.note,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
