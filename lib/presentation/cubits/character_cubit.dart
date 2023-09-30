import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/widgets/episodes/episodes_list.dart';

import '../../domain/model/character_model.dart';

class CharacterCubit extends Cubit<Character> {
  CharacterCubit()
      : super(
          Character(
            id: 0,
            name: "",
            image: "",
            status: "",
            location: Location(name: ""),
          ),
        );

  //notify
  setCharacter(Character character) => emit(character);
}
