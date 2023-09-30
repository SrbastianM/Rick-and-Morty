import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/pages/character_page.dart';
import 'package:rick_and_morty/presentation/pages/characters_page.dart';
import 'package:rick_and_morty/presentation/pages/episodes_page.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/dimensions.dart';

class ImageHomePage extends StatefulWidget {
  const ImageHomePage({super.key});

  @override
  State<ImageHomePage> createState() => _ImageHomePageState();
}

class _ImageHomePageState extends State<ImageHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screeHeight,
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            child: ClipOval(
              child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/rick_and_morty_main_page.jpg")),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          MaterialButton(
            minWidth: Dimensions.pageViewContainer,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CharactersPage(),
                ),
              );
            },
            color: AppColors.iconColor,
            child: Text('Characters Page',
                style: TextStyle(color: AppColors.cardColor)),
          ),
          SizedBox(
            height: 20,
          ),
          // Move to Character Page
          MaterialButton(
            minWidth: Dimensions.pageViewContainer,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CharacterPage(),
                ),
              );
            },
            color: AppColors.iconColor,
            child: Text('Character Page',
                style: TextStyle(color: AppColors.cardColor)),
          ),
          SizedBox(
            height: 20,
          ),
          // Move to Episodes Page
          MaterialButton(
            minWidth: Dimensions.pageViewContainer,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EpisodesPage(),
                ),
              );
            },
            color: AppColors.iconColor,
            child: Text('Episodes Page',
                style: TextStyle(color: AppColors.cardColor)),
          ),
        ],
      ),
    );
  }
}
