import 'package:flutter/foundation.dart';
import 'dart:convert';

UserModel transcationsFromJson(String str) =>
    UserModel.fromJson(json.decode(str));
String transactionsToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  int age;
  String email;
  String address;
  String phonenumber;

  UserModel({
    @required this.name,
    @required this.email,
    @required this.address,
    @required this.phonenumber,
    @required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["data"]["email"] as String,
        name: json["data"]["name"] as String,
        address: json["data"]["address"] as String,
        age: json["data"]["age"] as int,
        phonenumber: json["data"]["phonenumber"] as String,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "address": address,
        "phonenumber": phonenumber,
        "age": age,
      };
}
