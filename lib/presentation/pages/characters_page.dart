import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/characters/widgets/header_characters.dart';
import 'package:rick_and_morty/presentation/widgets/character/widget/list_recicler.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height30,
            ),
            HeaderCharacters(name: appName),
            ListOfCharacters(),
          ],
        ),
      ),
    );
  }
}
