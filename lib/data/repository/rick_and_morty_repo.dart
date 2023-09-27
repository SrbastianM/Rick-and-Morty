import 'package:rick_and_morty/data/api/api_client.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';

class RickAndMortyRepository {
  late ApiClient apiClient;

  Future<List<Character>> getCharacterList() async {
    return await ApiClient().getCharacter();
  }
}
