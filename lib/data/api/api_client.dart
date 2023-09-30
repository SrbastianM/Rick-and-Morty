import 'package:dio/dio.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';

class ApiClient {
  final url = 'https://rickandmortyapi.com/api/';
  final dio = Dio();

  Future<List<Character>> getCharacter() async {
    try {
      Response response = await dio.get("$url/character");
      if (response.statusCode == 200) {
        final List data = response.data['results'];

        List<Character> characters = [];
        for (var el in data) {
          characters.add(Character.fromJson(el));
        }
        return characters;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Episodes>> getEpisodes() async {
    try {
      Response response = await dio.get("$url/episode");
      if (response.statusCode == 200) {
        final List data = response.data['results'];

        List<Episodes> episodes = [];
        for (var el in data) {
          episodes.add(Episodes.fromJson(el));
        }
        return episodes;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Character?> filterCharacter(String name) async {
    try {
      Response response = await dio.get("$url/character/?name=$name");
      if (response.statusCode == 200) {
        final List data = response.data['results'];

        List<Character> characters = [];
        for (var el in data) {
          characters.add(Character.fromJson(el));
        }
        return characters.first;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
