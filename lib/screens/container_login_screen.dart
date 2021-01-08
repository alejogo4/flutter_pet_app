import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petApp/provider/google_sign_in.dart';
import 'package:petApp/screens/login_screen.dart';
import 'package:petApp/screens/home_screen.dart';
import 'package:provider/provider.dart';

class ContainerLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              print(snapshot);
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return Text('Cargando');
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            },
          ),
        ),
      );
}
