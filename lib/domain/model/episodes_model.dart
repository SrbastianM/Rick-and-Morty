class Episodes {
  int id;
  String name;
  String airDate;
  String episode;
  String created;

  Episodes(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.episode,
      required this.created});

  factory Episodes.fromJson(dynamic pJson) => Episodes(
      id: pJson["id"] ?? 0,
      name: pJson["name"] ?? "empty",
      airDate: pJson["air_date"] ?? "empty",
      episode: pJson["episode"] ?? "empty",
      created: pJson["created"] ?? "empty");
}
