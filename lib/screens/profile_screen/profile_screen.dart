import 'package:GIB_EG/components/rounded_button.dart';
import 'package:GIB_EG/components/screen_header.dart';
import 'package:GIB_EG/constants.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:GIB_EG/screens/statistics_screen/statistics_screen.dart';
import 'package:GIB_EG/utilities/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          ScreenHeader(
            screenName: "PROFILE",
            screenIcon: EgCons.profile,
          ),
          SizedBox(height: size.height * 0.05,),
          Expanded(
            flex: 4,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.all(const Radius.circular(50.0)),
                border: Border.all(color: Colors.black),
                image: DecorationImage(image: Image.asset("assets/sprites/profile_placeholder.png", fit: BoxFit.fill).image),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                RoundedButton(
                  text: "View statistics",
                  color: buttonColorPrimary,
                  textColor: buttonColorText,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StatisticsScreen();
                    }));
                  },
                ),
                RoundedButton(
                  text: "Sign out",
                  color: buttonColorPrimary,
                  textColor: buttonColorText,
                  press: () {
                    Provider.of<AuthenticationService>(context, listen: false).signOut();
                    Navigator.pushReplacementNamed(context, "/");
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
