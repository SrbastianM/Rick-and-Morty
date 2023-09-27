import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiCall {
  final dio = Dio();

  Future<List> getCharacter() async {
    const url = "https://rickandmortyapi.com/api/character";
    try {
      final response = await dio.get(url);
      print(response);
    } catch (e) {
      print(e);
    }
    return [];
  }
}
