import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petApp/router/generate_route.dart';

import 'package:petApp/router/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InitPage());
}

class InitPage extends StatelessWidget {
  const InitPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.loginBoot,
      onGenerateRoute: (settings) => GenerateRoute().init(settings, context),
      theme: ThemeData(fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
    );
  }
}
