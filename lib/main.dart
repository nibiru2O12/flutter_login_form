import 'package:flutter/material.dart';
import 'package:flutter_form/pages/Signin.dart';

void main() => runApp(MaterialApp(
      title: "Flutterd Form",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Form"),
        ),
        body: App(),
      ),
    ));

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Widget build(BuildContext context) {
    return Sigin();
  }
}
