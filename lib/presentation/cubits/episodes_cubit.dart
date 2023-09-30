import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:rick_and_morty/presentation/widgets/episodes/episodes_list.dart';

import '../../domain/model/character_model.dart';

class EpisodesCubit extends Cubit<List<Episodes>> {
  EpisodesCubit() : super([]);

  //notify
  setEpisodes(List<Episodes> list) => emit(list);
}
