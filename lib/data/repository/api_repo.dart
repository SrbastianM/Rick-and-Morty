import 'package:get/get.dart';

class ApiRepo {
  Future<Response> getCharacters() async {
    Response response = await ApiClient();
  }
}

final ApiRepo = ApiRepo();
