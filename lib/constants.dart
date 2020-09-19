import 'package:flutter/material.dart';

const qSpacingUnit = 10;

const qDefaultPaddin = 40.0;
const qPrimaryColor = Color(0xFFFF7643);
const qPrimaryLightColor = Color(0xFFFFECDF);
const qPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const qSecondaryColor = Color(0xFF979797);
const qTextColor = Color(0xFF757575);

const qAnimationDuration = Duration(milliseconds: 200);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String qEmailNullError = "Please enter your email";
const String qInvalidEmailNullError = "Please enter valid email";
const String qPassNullError = "Please enter your password";
const String qShortPassError = "Password is too short";
const String qMatchPassError = "Password doesn't match";
