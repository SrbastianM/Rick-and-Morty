import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubits.dart';
import 'package:rick_and_morty/presentation/pages/characters_page.dart';
import 'package:rick_and_morty/utils/big_text.dart';

class CharactersPageProvider extends StatelessWidget {
  const CharactersPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CharactersCubit(),
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => CharactersCubit(),
          ),
        ], child: BigText(text: "text")));
  }
}
