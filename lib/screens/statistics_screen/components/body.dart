import 'package:GIB_EG/components/background.dart';
import 'package:GIB_EG/components/rounded_button.dart';
import 'package:GIB_EG/constants.dart';
import 'package:GIB_EG/models/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        width: double.infinity,
        child: Consumer<Player>(
          builder: (context, player, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total player clicks: " + player.getStats().totalClicks.toString()),
              Text("Total player money earned: " + player.getStats().totalMoneyEarned.toString()),
              Text("Hello world!"),
              RoundedButton(
                  text: "back to profile",
                  textColor: buttonColorText,
                  color: buttonColorPrimary,
                  press: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
