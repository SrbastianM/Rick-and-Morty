import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/repository/character_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:rick_and_morty/presentation/cubits/characters_cubit.dart';
import 'package:rick_and_morty/presentation/cubits/episodes_cubit.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/big_text.dart';
import 'package:rick_and_morty/utils/dimensions.dart';
import 'package:rick_and_morty/utils/small_text.dart';

class EpisodesList extends StatefulWidget {
  const EpisodesList({super.key});

  @override
  State<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
  Future<List<Episodes>> getEpisodes() async {
    final repo = RickAndMortyRepository();
    return repo.getEpisodesList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            future: getEpisodes(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                  ),
                  child: BigText(text: "No Episodes"),
                );
              }
              final episodes = snapshot.data!;

              context.read<EpisodesCubit>().setEpisodes(episodes);

              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: episodes.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius15),
                                bottomRight:
                                    Radius.circular(Dimensions.radius15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.height15),
                                    child: BigText(
                                        text: episodes[index].id.toString()),
                                  )),
                                  ListTile(
                                    title: const Text(
                                      'Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Text(
                                      episodes[index].name,
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
                                      episodes[index].airDate,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.iconColor),
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
                                      episodes[index].created,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.iconColor),
                                    ),
                                  ),
                                  const Divider()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
