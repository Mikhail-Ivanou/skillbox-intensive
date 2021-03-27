import 'package:json_annotation/json_annotation.dart';

part 'episodes_response.g.dart';

@JsonSerializable()
class EpisodesResponse {
  EpisodesResponse({
    required this.id,
    required this.name,
    this.airDate,
    this.episode,
    this.characters,
  });

  final int id;
  final String name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? episode;
  final List<String>? characters;

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) => _$EpisodesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodesResponseToJson(this);
}
