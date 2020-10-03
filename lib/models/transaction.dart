import 'package:flutter/foundation.dart';
import 'dart:convert';

Transcations transcationsFromJson(String str) =>
    Transcations.fromJson(json.decode(str));
String transactionsToJson(Transcations data) => json.encode(data.toJson());

class Transcations {
  String id;
  String title;
  double amount;
  DateTime date;

  Transcations({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });

  factory Transcations.fromJson(Map<String, dynamic> json) => Transcations(
        amount: json["amount"] as double,
        date: json["date"] as DateTime,
        title: json["title"] as String,
        id: json["id"] as String,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "date": date,
        "title": title,
        "id": id,
      };
}
