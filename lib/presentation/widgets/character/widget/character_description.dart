import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/repository/rick_and_morty_repo.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/presentation/cubits/character_cubits.dart';
import 'package:rick_and_morty/utils/app_icon.dart';
import 'package:rick_and_morty/presentation/widgets/characters/widgets/header_characters.dart';
import 'package:rick_and_morty/presentation/widgets/character/widget/list_recicler.dart';
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
  Future<List<Character>> getCharacters() async {
    final repo = RickAndMortyRepository();
    return repo.getCharacterList();
  }

  @override
  Widget build(BuildContext context) {
    const String characterPage = "Character";
    return FutureBuilder(
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
            shrinkWrap: false,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Container(
                                width: Dimensions.width45,
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  color: AppColors.iconColor,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: Dimensions.iconSize24,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                HeaderCharacters(name: characterPage),
                CircleAvatar(
                  radius: 200,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                      child: Image.network(
                    (characters[index].image),
                  )),
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
                      characters[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.iconColor,
                      ),
                    )),
                ListTile(
                    title: const Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      characters[index].status,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.iconColor),
                    )),
                ListTile(
                  title: const Text(
                    'Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    characters[index].location.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.iconColor),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                const Divider(),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.height10),
                  child: BigText(text: "Wanna se another?"),
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
