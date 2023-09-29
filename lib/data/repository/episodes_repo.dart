import 'package:rick_and_morty/data/api/api_client.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';

class EpisodesRepository {
  late ApiClient apiClient;
  Future<List<Episodes>> getEpisodesList() async {
    return await ApiClient().getEpisodes();
  }
}
