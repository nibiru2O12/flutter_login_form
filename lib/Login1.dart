import 'package:flutter/material.dart';
import './common//FormTextField.dart';

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[buildForm()],
      ),
    );
  }

  Widget buildForm() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FormTextField(
              name: "email",
              label: "Email Address*",
              helperText: "Please provide a valird email address",
              placeholder: "something@any.com",
              prefix: Icon(Icons.email),
            ),
            FormTextField(
              name: "password",
              label: "Password*",
              helperText: "Password must be from 8 to 12 characters in length",
              prefix: Icon(Icons.lock_outline),
              isObscurable: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(fontSize: 12,color: Colors.grey),
                          ),
                        ),
                        FlatButton(
                          onPressed: (){},
                          child: Text(
                            "Did not receive your activation link?",
                            style: TextStyle(fontSize: 12,color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => print("login"),
                    child: Text("LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  RaisedButton buildSubmitButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Submitted value of ${_formKey.currentState}"),
          ));
        }
      },
      child: Text("Submit"),
    );
  }

  String requiredValidator(value) {
    if (value.isEmpty) {
      return "Please Enter a Value";
    }
    return null;
  }
}

