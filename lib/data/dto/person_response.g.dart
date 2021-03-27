// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonResponse _$PersonResponseFromJson(Map<String, dynamic> json) {
  return PersonResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    status: json['status'] as String,
    species: json['species'] as String,
    type: json['type'] as String,
    gender: json['gender'] as String,
    origin: LocationResponse.fromJson(json['origin'] as Map<String, dynamic>),
    location:
        LocationResponse.fromJson(json['location'] as Map<String, dynamic>),
    image: json['image'] as String,
    episode:
        (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
    url: json['url'] as String,
    created: DateTime.parse(json['created'] as String),
  );
}

Map<String, dynamic> _$PersonResponseToJson(PersonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created.toIso8601String(),
    };
