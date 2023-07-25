import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Simple_Text.dart';

class Photo_Container extends StatelessWidget {
  const Photo_Container({
    super.key,
    required this.width,
    required this.height,
    required this.src,
  });

  final double width;
  final double height;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width/1.2,
      height: height/4.5,

      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(width/20),
        image: DecorationImage(
            image: AssetImage(src),
            fit: BoxFit.cover),
      ),
    );
  }
}
