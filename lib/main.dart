import 'package:flutter/material.dart';
import 'package:petApp/router/generate_route.dart';

import 'package:petApp/router/routes.dart';

void main() {
  runApp(InitPage());
}

class InitPage extends StatelessWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.login,
      onGenerateRoute: (settings) => GenerateRoute().init(settings, context),
      theme: ThemeData(fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
    );
  }
}
