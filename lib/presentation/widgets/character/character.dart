import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/repository/rick_and_morty_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubits.dart';
import 'package:rick_and_morty/presentation/widgets/character/widget/character_description.dart';
import 'package:rick_and_morty/utils/big_text.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharactersCubit(),
      child: const Scaffold(
        body: DescriptionCharacter(),
      ),
    );
  }
}
