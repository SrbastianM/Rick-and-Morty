import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/pages/episodes_page.dart';
import 'package:rick_and_morty/utils/header.dart';
import 'package:rick_and_morty/presentation/widgets/characters/caracter_list_.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/dimensions.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPage();
}

class _CharactersPage extends State<CharactersPage> {
  final String appName = "Characters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              color: AppColors.iconColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.height70,
                      left: Dimensions.height20,
                    ),
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: Dimensions.iconSize24,
                    ),
                  ),
                  HeaderCharacters(name: appName),
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.height70,
                      right: Dimensions.height20,
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EpisodesPage(),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: ListOfCharacters(),
            ),
          )
        ],
      ),
    );
  }
}
