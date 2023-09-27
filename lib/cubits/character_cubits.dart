import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/character_model.dart';

class CharactersCubit extends Cubit<List<Character>> {
  CharactersCubit() : super([]);

  setCharacters(List<Character> list) => emit(list);
}

/*
 */