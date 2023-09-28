import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/big_text.dart';
import 'package:rick_and_morty/utils/dimensions.dart';

class HeaderCharacters extends StatelessWidget {
  final String name;

  const HeaderCharacters({
    super.key,
    required this.name,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(top: Dimensions.width45),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
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
