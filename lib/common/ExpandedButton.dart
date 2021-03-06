
import 'package:flutter/material.dart';

enum ButtonShape { RounderCorner, Default }

class ExpandedButton extends StatelessWidget {
  final Widget text;
  final ButtonShape shape;
  final Function onPressed;

  const ExpandedButton({Key key, this.text, this.shape,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ShapeBorder buttonShape;

    if(shape == ButtonShape.RounderCorner){
      buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)); 
    }

    return RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: text,
        shape: buttonShape);
  }
}
