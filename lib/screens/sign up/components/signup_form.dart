import 'package:flutter/material.dart';
import 'package:quotidian/components/default_button.dart';
import 'package:quotidian/widgets/transaction.dart';

import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: "Continue",
              press: () {
                Navigator.pushNamed(context, MyHomePage.routeName);
              }),
        ],
      ),
    );
  }
}

TextFormField buildNameFormField() {
  return TextFormField(
    obscureText: false,
    decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Full Name",
        floatingLabelBehavior: FloatingLabelBehavior.always),
  );
}

TextFormField buildEmailFormField() {
  return TextFormField(
    obscureText: false,
    decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always),
  );
}

TextFormField buildPhoneFormField() {
  return TextFormField(
    obscureText: false,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always),
  );
}
