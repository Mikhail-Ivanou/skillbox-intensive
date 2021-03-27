import 'package:rick_and_morty/data/dto/location_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_response.g.dart';

@JsonSerializable()
class PersonResponse {
  PersonResponse({
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

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationResponse origin;
  final LocationResponse location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory PersonResponse.fromJson(Map<String, dynamic> json) => _$PersonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}
