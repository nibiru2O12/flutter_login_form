
import 'package:flutter/material.dart';
import 'package:flutter_form/Header.dart';
import 'package:flutter_form/common/ColumnSpacer.dart';
import 'package:flutter_form/common/ExpandedButton.dart';
import 'package:flutter_form/common/RadioButton.dart';
import 'package:flutter_form/common/RoundedTextField.dart';
import 'package:flutter_form/pages/ForgotPassword.dart';
import 'package:flutter_form/pages/Signup.dart';

class Sigin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          new Header(),
          buildContent(context)
        ],
      ),
    );
  }

  ColumnSpacer buildContent(BuildContext context) {
    return ColumnSpacer(
          spacing: 16,
          children: <Widget>[
            buildEmailField(),
            buildPasswordField(),
            Row(
              children: <Widget>[
                Expanded(
                  child: new RadioButton(label: "Remeber"),
                ),
                buildFogoutButton(context)
              ],
            ),
            buildSigninButton(),
            buildSingupButton(context)
          ],
        );
  }

  GestureDetector buildFogoutButton(BuildContext context) {
    return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text("I forgot password"));
  }

  RoundedTextField buildPasswordField() {
    return new RoundedTextField(
              placeholder: "Password",
              isPassword: true,
            );
  }

  RoundedTextField buildEmailField() {
    return new RoundedTextField(
              placeholder: "Email Address",
            );
  }

  FlatButton buildSingupButton(BuildContext context) {
    return FlatButton(
              child: Text("Create account"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> Signup()
                ));
              },
            );
  }

  ExpandedButton buildSigninButton() {
    return new ExpandedButton(
              text: Text(
                "SIGN IN",
                style: TextStyle(
                    color: Colors.white, fontSize: 18, letterSpacing: 1),
              ),
              shape: ButtonShape.RounderCorner,
            );
  }
}

