import 'package:GIB_EG/presentation/eg_cons_icons.dart';
import 'package:flutter/material.dart';

class ShopHeader extends StatelessWidget {
  final String money;
  const ShopHeader({@required this.money});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(EgCons.trading,
                  size: 50, color: Color.fromRGBO(255, 231, 231, 100)),
              Text(
                "SHOP",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
          Row(
            children: [
              Icon(EgCons.currency,
                  size: 50, color: Color.fromRGBO(255, 231, 231, 100)),
              SizedBox(width: 10),
              Text(
                this.money,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}