import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quotidian/components/default_button.dart';
import 'package:quotidian/models/signupModel.dart';

import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key}) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

Future<SignUpModel> createUser(String email, String password, String name,
    String phonenumber, String address, String age) async {
  final http.Response response = await http.post(
    "http://54.89.116.234/api/users/auth/register",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "email": email,
      "password": password,
      "name": name,
      "address": address,
      "phonenumber": phonenumber,
      "age": age,
    }),
  );

  if (response.statusCode == 200) {
    return SignUpModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

class _SignUpFormState extends State<SignUpForm> {
  SignUpModel _user;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

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
          buildpasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildaddressFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildageFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          _user == null
              ? Container()
              : Text("The user'${_user.name},is created succesfully"),
          DefaultButton(
              text: "Continue",
              press: () async {
                final String email = _emailController.text;
                final String password = _passwordController.text;
                final String name = _nameController.text;
                final String phonenumber = _phoneController.text;
                final String address = _addressController.text;
                final String age = _ageController.text;

                final SignUpModel user = await createUser(
                    email, password, name, phonenumber, address, age);

                setState(() {
                  _user = user;
                });
              }),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: _nameController,
      obscureText: false,
      decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your Full Name",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      obscureText: false,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your Email",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      controller: _phoneController,
      obscureText: false,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter your Phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  TextFormField buildpasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: false,
      decoration: InputDecoration(
          labelText: "New Password",
          hintText: "Enter Password",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  TextFormField buildaddressFormField() {
    return TextFormField(
      controller: _addressController,
      obscureText: false,
      decoration: InputDecoration(
          labelText: "Address",
          hintText: "Enter your address",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  TextFormField buildageFormField() {
    return TextFormField(
      controller: _ageController,
      obscureText: false,
      decoration: InputDecoration(
          labelText: "Age",
          hintText: "Enter you age",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
