import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/widgets/episodes/episodes_list.dart';

import '../../domain/model/character_model.dart';

class CharactersCubit extends Cubit<List<Character>> {
  CharactersCubit() : super([]);

  //notify
  setCharacters(List<Character> list) => emit(list);
}
