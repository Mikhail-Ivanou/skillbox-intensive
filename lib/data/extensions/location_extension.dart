import 'package:flutter_2_app/data/dto/location_response.dart';
import 'package:flutter_2_app/models/location.dart';

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
