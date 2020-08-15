import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quotidian/components/default_button.dart';
import 'package:quotidian/constants.dart';
import 'package:quotidian/screens/splash/components/sign_form.dart';
import 'package:quotidian/size_config.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),
          child: Column(
            children: [
              Text("Welcome Back", 
              style: TextStyle(
                color: Colors.black,
                 fontsize: getProportionateScreenWidth(28),
                 fontWeight: FontWeight.bold,
                 ),
              ),
              Text(
                "Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SignForm(),
            ],
          ),
        ),
      ),
    );
  }
}

