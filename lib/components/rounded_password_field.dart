import 'package:GIB_EG/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color.fromRGBO(50, 21, 55, 60),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color.fromRGBO(50, 21, 55, 60),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}