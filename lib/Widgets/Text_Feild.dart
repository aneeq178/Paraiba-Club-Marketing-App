import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Text_Feild extends StatelessWidget {
  const Text_Feild({
    super.key,
    required this.text,
    required this.icon,
    required this.ccontroller,
    required this.validate,
  });

  final String text;
  final Icon icon;
  final String? Function(String? a) validate;
  final TextEditingController ccontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ccontroller,
      validator: validate,
      style: TextStyle(color: Colors.white), // sets text color to white
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.white),
        icon: icon,
        iconColor: Colors.white, // sets hint text color to white
        border: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // sets border color to white
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white), // sets enabled border color to white
        ),
      ),
    );
  }
}
