import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/repository/character_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubit.dart';
import 'package:rick_and_morty/presentation/cubits/characters_cubit.dart';
import 'package:rick_and_morty/utils/app_icon.dart';
import 'package:rick_and_morty/utils/header.dart';
import 'package:rick_and_morty/presentation/widgets/characters/caracter_list_.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/big_text.dart';
import 'package:rick_and_morty/utils/dimensions.dart';
import 'package:rick_and_morty/utils/small_text.dart';

class DescriptionCharacter extends StatefulWidget {
  const DescriptionCharacter({super.key});

  @override
  State<DescriptionCharacter> createState() => _DescriptionCharacterState();
}

class _DescriptionCharacterState extends State<DescriptionCharacter> {
  late TextEditingController _controller;
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> onInputSubmit(String value) async {
    final character = await filterCharacter(value);
    if (character == null) {
      setState(() {
        showError = true;
      });
    } else {
      setState(() {
        showError = false;
      });
      print(character.name);
      context.read<CharacterCubit>().setCharacter(character);
    }
  }

  Future<Character?> filterCharacter(String name) async {
    final repo = RickAndMortyRepository();
    return repo.filterByCharacterName(name);
  }

  @override
  Widget build(BuildContext context) {
    const String characterPage = "Character";
    return BlocBuilder<CharacterCubit, Character>(
      builder: (context, character) {
        if (character.id != 0) {
          return Column(
            children: [
              CircleAvatar(
                radius: 200,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    (character.image),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  character.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.iconColor,
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  character.status,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.iconColor),
                ),
              ),
              ListTile(
                title: const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  character.location.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.iconColor),
                ),
              ),
              const Divider(),
              Container(
                margin: EdgeInsets.only(top: Dimensions.height10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Enter the name of another character",
                      prefixIcon: Icon(Icons.person)),
                  controller: _controller,
                  onSubmitted: (String value) async {
                    onInputSubmit(value);
                  },
                ),
              ),
              const Divider(),
            ],
          );
        } else {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Enter a character name",
                      prefixIcon: Icon(Icons.person)),
                  controller: _controller,
                  onSubmitted: (String value) async {
                    onInputSubmit(value);
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
