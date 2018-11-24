import 'package:flutter/material.dart';
import 'package:flutter_form/Header.dart';
import 'package:flutter_form/common/ColumnSpacer.dart';
import 'package:flutter_form/common/ExpandedButton.dart';
import 'package:flutter_form/common/FormTextField.dart';
import 'package:flutter_form/common/RoundedTextField.dart';

class Signup extends StatefulWidget {
  @override
  SignupState createState() {
    return new SignupState();
  }
}

class SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: buildSignup(context),
    );
  }

  Container buildSignup(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Header(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Welcome!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Form(
              key: _formKey,
              child: ColumnSpacer(
                spacing: 16,
                children: <Widget>[
                  FormTextField(
                    name: "username",
                    placeholder: "Username",
                    shape: TextShape.RoundedCorner,
                    validator: (String value) =>
                        value.isEmpty ? "Please provide a username" : null,
                  ),
                  FormTextField(
                    name: "email",
                    placeholder: "Email address",
                    shape: TextShape.RoundedCorner,
                    validator: (String value) => value.isEmpty
                        ? "Please provide a valid email address"
                        : null,
                  ),
                  FormTextField(
                    name: "password",
                    placeholder: "Password",
                    shape: TextShape.RoundedCorner,
                    validator: (String value) =>
                        value.isEmpty ? "Please provide a password" : null,
                  ),
                  ExpandedButton(
                    shape: ButtonShape.RounderCorner,
                    text: Text(
                      "CREATE ACCOUNT",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _requiredValidation,
                  ),
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Back"),
                  )
                ],
              ),
            )
          ],
        ));
  }

  _requiredValidation() {
    if (_formKey.currentState.validate()) {
      print('Please check your email for account validation');
    }
  }
}
