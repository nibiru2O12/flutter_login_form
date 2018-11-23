
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {

  final String label;

  const RadioButton({
    Key key,
    this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          groupValue: "",
          onChanged: null,
          value: true,
        ),
        Text(label)
      ],
    );
  }
}