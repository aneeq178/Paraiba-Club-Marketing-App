import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Simple_Text extends StatelessWidget {
  const Simple_Text({
    super.key,
    required this.text,
    required this.color,
    required this.size,
  });

  final String text;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(color: color, fontSize: size),
    );
  }
}
