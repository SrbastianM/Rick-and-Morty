import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubits.dart';
import 'package:rick_and_morty/data/repository/rick_and_morty_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/utils/dimensions.dart';
import 'package:rick_and_morty/presentation/widgets/big_text.dart';
import 'package:rick_and_morty/presentation/widgets/small_text.dart';

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
                return const Text("No characters");
              }

              final characters = snapshot.data!;

              context.read<CharactersCubit>().setCharacters(characters);

              return BlocBuilder<CharactersCubit, List<Character>>(
                builder: (context, characters) => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height10,
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
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                //widget que tome una url y cargue una imagen
                                image: AssetImage("asset/Soy ese.png"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextContSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius20),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius20),
                                ),
                                color: Colors.white,
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
            })
      ],
    );
  }
}
