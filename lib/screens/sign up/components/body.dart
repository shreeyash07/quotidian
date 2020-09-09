import 'package:flutter/material.dart';
import 'package:quotidian/screens/sign%20up/components/signup_form.dart';
import 'package:quotidian/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Register",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Please fill the form to register your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
