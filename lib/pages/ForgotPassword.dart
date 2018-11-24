import 'package:flutter/material.dart';
import 'package:flutter_form/Header.dart';
import 'package:flutter_form/common/ColumnSpacer.dart';
import 'package:flutter_form/common/ExpandedButton.dart';
import 'package:flutter_form/common/FormTextField.dart';

class ForgetPassword extends StatefulWidget {
  @override
  ForgetPasswordState createState() {
    return new ForgetPasswordState();
  }
}

class ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: "asd");

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              ColumnSpacer(
                spacing: 16,
                children: <Widget>[
                  Header(),
                  buildTitle(),
                  buildMessage(),
                  Form(
                    key: _formKey,
                    child: FormTextField(
                      name: "email",
                      placeholder: "Email address",
                      keyboardType: TextInputType.emailAddress,
                      shape: TextShape.RoundedCorner,
                      actionType: TextInputAction.send,
                      onSubmit: _onSubmit,
                      validator: (value) =>
                          value.isEmpty ? "Please enter your email" : null,
                    ),
                  ),
                  buildSendButton(),
                  buildBackButton(context)
                ],
              )
            ],
          ),
        ),
      );
  }

  ExpandedButton buildSendButton() {
    return ExpandedButton(
      shape: ButtonShape.RounderCorner,
      text: Text(
        "SEND",
        style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1),
      ),
      onPressed: ()=>_onSubmit(""),
    );
  }

  _onSubmit(String value) {
      if(_formKey.currentState.validate()){
        print('Please check your email.');
      }
    }

  FlatButton buildBackButton(BuildContext context) {
    return FlatButton(
      child: Text("Back"),
      onPressed: () => Navigator.pop(context),
    );
  }

  Container buildMessage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        "Enter the email address you use and you will receive an email a link for changing your password",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(height: 2),
      ),
    );
  }

  Container buildTitle() {
    return Container(
        child: Text(
      "Forgot you password?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
    ));
  }
}
