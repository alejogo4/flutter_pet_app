import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petApp/widgets/custom_button.dart';
import 'package:petApp/widgets/custom_icon_button.dart';

class LoginScreen extends StatelessWidget {
  String id;
  Color color;
  LoginScreen({this.id, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            )
          ],
        ),
      ),
    );
  }
}
