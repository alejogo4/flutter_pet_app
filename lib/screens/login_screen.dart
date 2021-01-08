import 'package:flutter/material.dart';
import 'package:petApp/config/configuration.dart';
import 'package:petApp/widgets/Auth/pet_logo.dart';
import 'package:petApp/widgets/Auth/google_signup_button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: tertiaryBlue.withAlpha(20),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: secondaryBlue),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: white, width: 2),
            color: primaryBlue),
        child: Text(
          'Registrarse',
          style: TextStyle(fontSize: 20, color: white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/1200x/18/5a/49/185a498c5344bde8e3f36cca8055773c.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PetLogo(),
              SizedBox(
                height: 80,
              ),
              _submitButton(),
              SizedBox(
                height: 20,
              ),
              GoogleSignupButtonWidget(
                backgroundColor: Colors.red,
                borderColor: Colors.black,
                icon: FontAwesomeIcons.google,
                text: 'Login con Google',
              ),
              SizedBox(
                height: 20,
              ),
              GoogleSignupButtonWidget(
                backgroundColor: Colors.blueAccent,
                borderColor: Colors.black,
                icon: FontAwesomeIcons.facebook,
                text: 'Login con Facebook',
              ),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
