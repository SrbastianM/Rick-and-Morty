import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/cubits/character_cubits.dart';
import 'package:rick_and_morty/pages/home_page.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubit.dart';
import 'package:rick_and_morty/presentation/cubits/episodes_cubit.dart';
import 'package:rick_and_morty/presentation/pages/characters_page.dart';

import 'package:rick_and_morty/presentation/pages/home_page.dart';
import 'package:rick_and_morty/presentation/cubits/characters_cubit.dart';
import 'package:rick_and_morty/utils/app_colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersCubit>(
          create: (BuildContext context) => CharactersCubit(),
        ),
        BlocProvider<EpisodesCubit>(
          create: (BuildContext context) => EpisodesCubit(),
        ),
        BlocProvider<CharacterCubit>(
          create: (BuildContext context) => CharacterCubit(),
        ),
      ],
      child: GetMaterialApp(
          title: 'Rick And Morty',
          theme: ThemeData(
            primaryColor: AppColors.mainColor,
          ),
          home: const HomePage()),
    );
  }
}
// route 