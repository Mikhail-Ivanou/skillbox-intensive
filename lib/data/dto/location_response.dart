import 'package:json_annotation/json_annotation.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse {
  LocationResponse({
    required this.name,
    this.type,
    this.dimension,
    this.residents,
  });

  final String name;
  final String? type;
  final String? dimension;
  final List<String>? residents;

  factory LocationResponse.fromJson(Map<String, dynamic> json) => _$LocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
