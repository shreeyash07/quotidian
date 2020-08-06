import 'package:flutter/foundation.dart';

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
}
