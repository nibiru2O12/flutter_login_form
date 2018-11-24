import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

enum TextShape {
  RoundedCorner,
  Rectangle,
}

class FormTextField extends StatefulWidget {
  final Key key;
  final Function validator;
  final String placeholder;
  final String name;
  final String label;
  final Widget prefix;
  final Widget suffix;
  final TextInputType keyboardType;
  final bool isObscurable;
  final Function onSubmit;
  final TextInputAction actionType;

  /// Will only be visible when no shape is defined
  final String helperText;
  final TextShape shape;

  FormTextField(
      {this.key,
      @required this.name,
      this.placeholder,
      this.label,
      this.isObscurable = false,
      this.prefix,
      this.suffix,
      this.helperText = "",
      this.validator,
      this.shape,
      this.keyboardType,
      this.onSubmit,
      this.actionType})
      : super(key: key);

  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool isHidden = true;

  togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  Widget build(BuildContext context) {
    return buildTextField();
  }

  Widget buildTextField() {
    BoxDecoration rounded;
    InputDecoration inputStyle;
    if (widget.shape != null) {
      rounded = BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      );
    }

    return ShapedContainer(
      shape: widget.shape,
      placeholder: widget.placeholder,
      defaultTextDecoration: InputDecoration(
        helperText: widget.helperText,
        prefixIcon: widget.prefix,
        suffix: widget.isObscurable ? buildObsurableButton() : widget.suffix,
        hintText: widget.placeholder,
        labelText: widget.label,
      ),
      // margin: EdgeInsets.only(bottom: widget.helperText.isEmpty ? 20 : 30),
      builder: (decoration) => TextFormField(
          textInputAction: widget.actionType,
          onFieldSubmitted: widget.onSubmit,
          obscureText: widget.isObscurable ? isHidden : false,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          decoration: decoration),
    );
  }

  IconButton buildObsurableButton() {
    return IconButton(
      icon: Icon(isHidden ? Icons.cloud_off : Icons.cloud_queue),
      onPressed: togglePasswordVisibility,
    );
  }
}

class ShapedContainer extends StatelessWidget {
  final Function builder;
  final Color borderColor;
  final String placeholder;
  final TextShape shape;
  final InputDecoration defaultTextDecoration;

  ShapedContainer(
      {this.builder,
      this.borderColor = Colors.grey,
      this.placeholder,
      this.shape,
      this.defaultTextDecoration});

  @override
  Widget build(BuildContext context) {
    InputDecoration _textDecoration;
    BorderRadius radius;
    BoxDecoration _boxDecoration;
    EdgeInsets _padding;

    switch (shape) {
      case TextShape.Rectangle:
        _padding = EdgeInsets.all(16);
        _textDecoration = InputDecoration.collapsed(
          hintText: placeholder,
        );
        _boxDecoration = BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: radius,
        );
        break;
      case TextShape.RoundedCorner:
        _padding = EdgeInsets.all(16);
        radius = BorderRadius.all(Radius.circular(30.0));
        _textDecoration = InputDecoration.collapsed(
          hintText: placeholder,
        );
        _boxDecoration = BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: radius,
        );
        break;
      default:
        radius = null;
        _textDecoration = defaultTextDecoration;
    }

    return Container(
      padding: _padding,
      decoration: _boxDecoration,
      child: builder(_textDecoration),
    );
  }
}
