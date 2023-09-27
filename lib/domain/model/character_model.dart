class Character {
  int id;
  String name;
  String image;
  String status;
  Location location;

  Character(
      {required this.id,
      required this.name,
      required this.image,
      required this.status,
      required this.location});

  factory Character.fromJson(dynamic pJson) => Character(
      id: pJson["id"] ?? 0,
      name: pJson["name"] ?? "empty",
      image: pJson["image"] ?? "empty",
      status: pJson["status"] ?? "empty",
      location: Location.fromJson(pJson["location"]));
}

class Location {
  String name;

  Location({required this.name});

  factory Location.fromJson(dynamic pJson) =>
      Location(name: pJson["name"] ?? "");
}
