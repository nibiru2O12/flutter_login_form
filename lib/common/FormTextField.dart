
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class FormTextField extends StatefulWidget {
  final Function validator;
  final String placeholder;
  final String name;
  final String label;
  final Widget prefix;
  final Widget suffix;
  final bool isObscurable;
  final String helperText;

  FormTextField(
      {@required this.name,
      this.placeholder,
      this.label,
      this.isObscurable = false,
      this.prefix,
      this.suffix,
      this.helperText,
      this.validator});

  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool isHidden = true;

  String validator(String value) {
    if (value.isEmpty) {
      return "Enter your Password";
    }
    return null;
  }

  togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  Widget build(BuildContext context) {
    return buildTextField();
  }

  Widget buildTextField() {
    return Container(
      margin: EdgeInsets.only(bottom: widget.helperText.isEmpty ? 20 : 30),
      child: TextFormField(
        obscureText: widget.isObscurable ? isHidden : false,
        validator: validator,
        autofocus: true,
        decoration: InputDecoration(
          helperText: widget.helperText,
          prefixIcon: widget.prefix,
          suffix: widget.isObscurable ? buildObsurableButton() : widget.suffix,
          hintText: widget.placeholder,
          labelText: widget.label,
        ),
      ),
    );
  }

  IconButton buildObsurableButton() {
    return IconButton(
      icon: Icon(isHidden ? Icons.cloud_off : Icons.cloud_queue),
      onPressed: togglePasswordVisibility,
    );
  }
}