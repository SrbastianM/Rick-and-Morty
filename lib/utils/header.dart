import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/big_text.dart';
import 'package:rick_and_morty/utils/dimensions.dart';

class HeaderCharacters extends StatelessWidget {
  final String name;
  Color? color;

  HeaderCharacters({
    super.key,
    required this.name,
    this.color = const Color.fromARGB(255, 253, 242, 225),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.width45, bottom: Dimensions.width20),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    color: color,
                    text: name,
                    size: Dimensions.font26,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
