import 'package:flutter/material.dart';

class ShopTypeButton extends StatelessWidget {
  final String text;

  const ShopTypeButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      margin: const EdgeInsets.all(15.0),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
      ),
    );
  }
}