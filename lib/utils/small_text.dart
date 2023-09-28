import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/app_colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  SmallText(
      {super.key,
      required this.text,
      this.color = AppColors.smallTextColor,
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
