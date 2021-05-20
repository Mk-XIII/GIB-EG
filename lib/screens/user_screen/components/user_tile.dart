import 'package:GIB_EG/constants.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String username;

  const UserTile({@required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
        child: Text(
          this.username,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: buttonColorPrimary, width: 2.0),
        borderRadius: BorderRadius.circular(29),
      ),
    );
  }
}
