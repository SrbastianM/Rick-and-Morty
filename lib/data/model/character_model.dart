import 'dart:convert';

class Character {
  int id;
  String name;
  String status;
  Location location;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.location,
  });

  factory Character.fromJson(dynamic pJson) => Character(
    id: pJson["id"] ?? "",
    name: pJson["name"] ?? "",
    status: pJson["status"] ?? "",
    location: pJson["name"] ?? "" 
  );
}

class Location {
  String name;

  Location({
    required this.name
  })
}
