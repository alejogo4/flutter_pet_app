import 'package:flutter/material.dart';
import 'package:petApp/router/routes.dart';
import 'package:petApp/screens/login_screen.dart';
import 'package:petApp/screens/splash_screen.dart';
import 'package:petApp/screens/container_login_screen.dart';

import '../screens/home_screen.dart';

class GenerateRoute {
  Route<dynamic> init(settings, context) {
    switch (settings.name) {
      case (Routes.splashscreen):
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case (Routes.loginBoot):
        return MaterialPageRoute(builder: (context) => ContainerLoginScreen());
      case (Routes.login):
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case (Routes.home):
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}
