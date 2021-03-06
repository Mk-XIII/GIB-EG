import 'package:GIB_EG/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: Color.fromRGBO(50, 21, 55, 60),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromRGBO(50, 21, 55, 60), 
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}