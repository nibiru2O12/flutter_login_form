
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String placeholder;
  final isPassword;

  const RoundedTextField({Key key, this.placeholder, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration.collapsed(
          hintText: placeholder,
        ),
      ),
    );
  }
}
