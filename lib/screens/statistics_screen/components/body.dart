import 'package:GIB_EG/components/background.dart';
import 'package:GIB_EG/components/rounded_button.dart';
import 'package:GIB_EG/components/screen_header.dart';
import 'package:GIB_EG/constants.dart';
import 'package:GIB_EG/models/player.dart';
import 'package:GIB_EG/presentation/eg_cons_icons.dart';
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
              ScreenHeader(
                  screenName: "STATISTICS", screenIcon: EgCons.profile),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Center(
                        child: Text(
                          "Total player clicks: " +
                              player.getStats().totalClicks.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: buttonColorPrimary, width: 2.0),
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Center(
                        child: Text(
                          "Total player money earned: " +
                              player.getStats().totalMoneyEarned.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: buttonColorPrimary, width: 2.0),
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                  ],
                ),
              ),
              RoundedButton(
                  text: "Back to profile",
                  textColor: buttonColorText,
                  color: buttonColorPrimary,
                  press: () {
                    Navigator.pop(context);
                  }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
