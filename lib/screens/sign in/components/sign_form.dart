import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quotidian/components/default_button.dart';
import 'package:quotidian/screens/homescreenUI/home_screen.dart';
import 'package:quotidian/screens/sign%20up/sign_up_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

const SERVER_IP = 'http://52.0.170.63/';
final storage = FlutterSecureStorage();

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> logIn(String email, String password) async {
    print(email);
    print(password);
    final http.Response res = await http.post(
      "http://54.89.116.234/api/users/auth/login",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return null;
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
            press: () async {
              var email = _emailController.text;
              var password = _passwordController.text;
              var jwt = await logIn(email, password);
              if (jwt != null) {
                storage.write(key: "jwt", value: jwt);
                Navigator.pushNamed(context, HomeScreen.routeName);
              } else {
                displayDialog(context, "An Error Occurred",
                    "No account was found matching that username and password");
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
      controller: _passwordController,
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
      controller: _emailController,
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
