import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotidian/screens/sign%20in/components/sign_form.dart';
import 'package:quotidian/screens/sign%20up/sign_up_screen.dart';
import 'package:quotidian/size_config.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Sign in with your email and password \nor \ncontinue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              SignForm(),
            ],
          ),
        ),
      ),
    );
  }
}
