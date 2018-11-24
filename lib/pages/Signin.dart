import 'package:flutter/material.dart';
import 'package:flutter_form/Header.dart';
import 'package:flutter_form/common/ColumnSpacer.dart';
import 'package:flutter_form/common/ExpandedButton.dart';
import 'package:flutter_form/common/FormTextField.dart';
import 'package:flutter_form/common/RadioButton.dart';
import 'package:flutter_form/common/RoundedTextField.dart';
import 'package:flutter_form/pages/ForgotPassword.dart';
import 'package:flutter_form/pages/Signup.dart';

class Sigin extends StatefulWidget {
  @override
  SiginState createState() {
    return new SiginState();
  }
}

class SiginState extends State<Sigin> {

  final _formKey = GlobalKey<FormState>();

  _requiredValidation(String value){
    if(value.isEmpty){
      return "Please provide a value";
    }
    return null;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          new Header(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          buildContent(context)
        ],
      ),
    );
  }

  Form buildContent(BuildContext context) {
    return Form(
      key: _formKey,
      child: ColumnSpacer(
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
          buildSigninButton(context),
          buildSingupButton(context)
        ],
      ),
    );
  }

  GestureDetector buildFogoutButton(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgetPassword()));
        },
        child: Text("I forgot password"));
  }

  FormTextField buildPasswordField() {
    return new FormTextField(
      name: "password",
      placeholder: "Password",
      isObscurable: true,
      shape: TextShape.RoundedCorner,
      validator: (value)=>value.isEmpty ? "Please enter your password" : null ,
    );
  }

   FormTextField buildEmailField() {
    return new FormTextField(
      name: "email",
      placeholder: "Email Address",
      shape: TextShape.RoundedCorner,
      validator: (value)=>value.isEmpty ? "Please enter your email" : null ,
    );
  }

  FlatButton buildSingupButton(BuildContext context) {
    return FlatButton(
      child: Text("Create account"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Signup()));
      },
    );
  }

  ExpandedButton buildSigninButton(BuildContext context) {
    return new ExpandedButton(
      text: Text(
        "SIGN IN",
        style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1),
      ),
      shape: ButtonShape.RounderCorner,
      onPressed: (){
        if(_formKey.currentState.validate()){
          print('you are logged in');
        }
      },
    );
  }
}
