import 'package:flutter/material.dart';
import 'package:flutter_form/Header.dart';
import 'package:flutter_form/common/ColumnSpacer.dart';
import 'package:flutter_form/common/ExpandedButton.dart';
import 'package:flutter_form/common/RoundedTextField.dart';


class Signup extends StatelessWidget {
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
          ColumnSpacer(
            spacing: 16,
            children: <Widget>[
              RoundedTextField(
                placeholder: "Username",
              ),
              RoundedTextField(
                placeholder: "Email address",
              ),
              RoundedTextField(
                placeholder: "Password",
              ),
              ExpandedButton(
                shape: ButtonShape.RounderCorner,
                text: Text("CREATE ACCOUNT"),
              ),
              FlatButton(
                onPressed: ()=>Navigator.pop(context),
                child: Text("Back"),
              )
            ],
          )
        ],
      )
    );
  }
}
