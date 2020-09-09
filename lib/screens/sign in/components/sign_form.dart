import 'package:flutter/material.dart';
import 'package:quotidian/components/default_button.dart';
import 'package:quotidian/screens/sign%20up/sign_up_screen.dart';
import 'package:quotidian/screens/HomeScreenUI/home_screen.dart';
import 'package:quotidian/widgets/transaction.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: qPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              Text(
                "Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              Text("Don't have an account ?"),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUp.routeName);
                },
                child: Text("click here"),
              )
            ],
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newvalue) => password = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(qPassNullError)) {
          setState(() {
            errors.remove(qPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(qShortPassError)) {
          setState(() {
            errors.remove(qShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(qPassNullError)) {
          setState(() {
            errors.add(qPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(qShortPassError)) {
          setState(() {
            errors.add(qShortPassError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newvalue) => email = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(qEmailNullError)) {
          setState(() {
            errors.remove(qEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(qEmailNullError)) {
          setState(() {
            errors.remove(qInvalidEmailNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(qEmailNullError)) {
          setState(() {
            errors.add(qEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(qEmailNullError)) {
          setState(() {
            errors.add(qInvalidEmailNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
