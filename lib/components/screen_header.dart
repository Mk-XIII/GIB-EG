import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String screenName;
  final IconData screenIcon;
  final Widget additionalInfo;

  const ScreenHeader(
      {@required this.screenName,
      @required this.screenIcon,
      this.additionalInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(screenIcon,
                  size: 50, color: Color.fromRGBO(255, 231, 231, 100)),
              Text(
                screenName,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
          if(additionalInfo != null) additionalInfo,
        ],
      ),
    );
  }
}
