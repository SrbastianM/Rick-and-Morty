import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/repository/character_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/presentation/cubits/characters_cubit.dart';
import 'package:rick_and_morty/presentation/pages/episodes_page.dart';
import 'package:rick_and_morty/presentation/widgets/character/character_description.dart';
import 'package:rick_and_morty/utils/header.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/big_text.dart';
import 'package:rick_and_morty/utils/dimensions.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    final String characterPage = "Character";
    return BlocProvider(
      create: (_) => CharactersCubit(),
      child: Scaffold(
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
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                    HeaderCharacters(name: characterPage),
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
                          Icons.list,
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
                child: DescriptionCharacter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
