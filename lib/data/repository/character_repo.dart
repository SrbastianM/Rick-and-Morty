import 'package:rick_and_morty/data/api/api_client.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';

class RickAndMortyRepository {
  ApiClient apiClient = ApiClient();

  Future<List<Character>> getCharacterList() async {
    return await apiClient.getCharacter();
  }

  Future<Character?> filterByCharacterName(String name) async {
    return await apiClient.filterCharacter(name);
  }

  Future<List<Episodes>> getEpisodesList() async {
    return await ApiClient().getEpisodes();
  }
}
