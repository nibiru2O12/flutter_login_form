import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.g_translate,
            size: 150,
            color: Colors.accents[5],
          ),
        ],
      ),
    );
  }
}
