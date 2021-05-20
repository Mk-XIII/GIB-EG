import 'package:GIB_EG/utilities/authentication_services.dart';
import 'package:GIB_EG/components/already_have_an_account_acheck.dart';
import 'package:GIB_EG/components/rounded_button.dart';
import 'package:GIB_EG/components/rounded_input_field.dart';
import 'package:GIB_EG/components/rounded_password_field.dart';
import 'package:GIB_EG/constants.dart';
import 'package:GIB_EG/screens/loadingScreen.dart';
import 'package:GIB_EG/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:GIB_EG/components/background.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();  

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
            RoundedInputField(
              controller: emailcontroller,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordcontroller,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              color: buttonColorPrimary,
              textColor: buttonColorText,
              press: () async {
                String result = await context.read<AuthenticationService>().signIn(
                          email: emailcontroller.text,
                          password: passwordcontroller.text,
                        );

                if (result != "Signed in") {
                  //implement what to do on unsuccessful sign in attempt
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loading()));
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
