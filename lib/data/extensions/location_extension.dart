import 'package:rick_and_morty/data/dto/location_response.dart';
import 'package:rick_and_morty/models/location.dart';

extension LocationExtension on LocationResponse {
  Location toModel() {
    return Location(
      name: name,
      dimension: dimension,
      type: type,
      residents: residents,
    );
  }
}
