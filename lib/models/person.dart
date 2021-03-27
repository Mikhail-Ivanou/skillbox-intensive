import 'package:flutter_2_app/models/location.dart';

class Person {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Person({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}

List<String> getCharactersIds(List<String>? characters) {
  return characters?.map((e) => getId(e)).toList() ?? [];
}

String getId(String url) {
  return url.substring(42);
}
