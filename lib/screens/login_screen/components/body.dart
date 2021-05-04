import 'package:GIB_EG/components/already_have_an_account_acheck.dart';
import 'package:GIB_EG/components/rounded_button.dart';
import 'package:GIB_EG/components/rounded_input_field.dart';
import 'package:GIB_EG/components/rounded_password_field.dart';
import 'package:GIB_EG/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:GIB_EG/components/background.dart';
import 'package:GIB_EG/screens/signup_screen/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              color: Color.fromRGBO(50, 21, 55, 100),
              textColor: Color.fromRGBO(255, 231, 231, 100),
              press: () {
                Navigator.pushReplacementNamed(
                  context, 
                  "/loading");
              }
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}