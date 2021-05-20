import 'package:GIB_EG/components/already_have_an_account_acheck.dart';
import 'package:GIB_EG/components/rounded_button.dart';
import 'package:GIB_EG/components/rounded_input_field.dart';
import 'package:GIB_EG/components/rounded_password_field.dart';
import 'package:GIB_EG/screens/login_screen/login_screen.dart';
import 'package:GIB_EG/utilities/authentication_services.dart';
import 'package:GIB_EG/utilities/database_services.dart';
import 'package:flutter/material.dart';
import 'package:GIB_EG/components/background.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final TextEditingController usernamecontroller = TextEditingController();
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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: usernamecontroller,
              hintText: "Username",
              onChanged: (value) {},
            ),
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
              color: Color.fromRGBO(50, 21, 55, 100),
              textColor: Color.fromRGBO(255, 231, 231, 100),
              text: "SIGNUP",
              press: () async {
                String result = await context.read<AuthenticationService>().singUp(
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
                  username: usernamecontroller.text,
                  db: Provider.of<DatabaseService>(context, listen: false),
                );

                if (result != "Signed up") {
                  //implement what to do on insuccessful sign up attempt
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
