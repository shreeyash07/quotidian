import 'package:flutter/foundation.dart';
import 'dart:convert';

SignUpModel transcationsFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));
String transactionsToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String name;
  String age;
  String email;
  String password;
  String address;
  String phonenumber;

  SignUpModel({
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.address,
    @required this.phonenumber,
    @required this.age,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: json["email"] as String,
        password: json["password"] as String,
        name: json["name"] as String,
        address: json["address"] as String,
        age: json["age"] as String,
        phonenumber: json["phonenumber"] as String,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "address": address,
        "phonenumber": phonenumber,
        "age": age,
      };
}
