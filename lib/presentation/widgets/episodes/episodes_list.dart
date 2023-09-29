import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/repository/episodes_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubits.dart';
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
    final repo = EpisodesRepository();
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
                  child: BigText(text: "No Characters"),
                );
              }
              final episodes = snapshot.data!;

              context.read<EpisodesCubit>().setEpisodes(episodes);
              print(episodes);

              return BlocBuilder<EpisodesCubit, List<Episodes>>(
                builder: (context, episodes) => ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: episodes.length,
                  itemBuilder: (context, index) {
                    Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextContSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius15),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius15),
                                ),
                                color: AppColors.cardColor,
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
                                    BigText(
                                      text: episodes[index].id.toString(),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(text: episodes[index].name),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(text: episodes[index].episode),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
