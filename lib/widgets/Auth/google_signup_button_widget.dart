import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petApp/data/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final String text;

  GoogleSignupButtonWidget(
      {this.borderColor,
      this.backgroundColor,
      this.icon,
      this.text,
      this.iconColor});

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: backgroundColor,
        ),
        child: TextButton.icon(
          label: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          icon: FaIcon(icon, color: Colors.white),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}
