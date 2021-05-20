import 'package:GIB_EG/components/rounded_button.dart';
import 'package:GIB_EG/screens/login_screen/login_screen.dart';
import 'package:GIB_EG/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:GIB_EG/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Container(
        width: double.infinity,
        child: Column(    
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "GIB EG",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 75, color: Colors.black54),
            ),
            SizedBox(height: size.height * 0.05),         
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              color: Color.fromRGBO(50, 21, 55, 100),
              textColor: Color.fromRGBO(255, 231, 231, 100),
              press: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: Color.fromRGBO(50, 21, 55, 100),
              textColor: Color.fromRGBO(255, 231, 231, 100),
              press: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}