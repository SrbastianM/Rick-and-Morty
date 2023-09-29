import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/cubits/episodes_cubit.dart';
import 'package:rick_and_morty/presentation/widgets/episodes/episodes_list.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/dimensions.dart';
import 'package:rick_and_morty/utils/header.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  final String appName = "Episodes";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EpisodesCubit(),
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
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: EpisodesList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
