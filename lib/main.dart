import 'package:petApp/screens/drawer_screen.dart';
import 'package:petApp/screens/home_screen.dart';
import 'package:petApp/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            LoginScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
