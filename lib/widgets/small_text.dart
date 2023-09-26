import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  SmallText(
      {super.key,
      required this.text,
      this.color = const Color(0xFFccc7c5),
      this.size = 14,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
