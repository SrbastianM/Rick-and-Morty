import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubit.dart';
import 'package:rick_and_morty/presentation/cubits/characters_cubit.dart';
import 'package:rick_and_morty/data/repository/character_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/presentation/pages/character_page.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/dimensions.dart';
import 'package:rick_and_morty/utils/big_text.dart';
import 'package:rick_and_morty/utils/small_text.dart';

class ListOfCharacters extends StatefulWidget {
  const ListOfCharacters({super.key});

  @override
  State<ListOfCharacters> createState() => _ListOfCharactersState();
}

class _ListOfCharactersState extends State<ListOfCharacters> {
  Future<List<Character>> getCharacters() async {
    final repo = RickAndMortyRepository();
    return repo.getCharacterList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: getCharacters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              return Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height20,
                ),
                child: BigText(text: "No Characters"),
              );
            }

            final characters = snapshot.data!;

            context.read<CharactersCubit>().setCharacters(characters);

            return BlocBuilder<CharactersCubit, List<Character>>(
              builder: (context, characters) => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.listViewImg,
                          height: Dimensions.listViewImg,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                            color: Colors.white38,
                            image: DecorationImage(
                              image: NetworkImage((characters[index].image)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius15),
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
                                    text: characters[index].name,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  SmallText(text: characters[index].status),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  SmallText(
                                      text: characters[index].location.name),
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
        )
      ],
    );
  }
}
