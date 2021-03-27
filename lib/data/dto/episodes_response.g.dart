// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodesResponse _$EpisodesResponseFromJson(Map<String, dynamic> json) {
  return EpisodesResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    airDate: json['air_date'] as String?,
    episode: json['episode'] as String?,
    characters: (json['characters'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$EpisodesResponseToJson(EpisodesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'episode': instance.episode,
      'characters': instance.characters,
    };
