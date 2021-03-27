import 'package:flutter_2_app/data/dto/person_response.dart';
import 'package:flutter_2_app/models/person.dart';
import 'package:flutter_2_app/data/extensions/location_extension.dart';

extension PersonExtension on PersonResponse {
  Person toModel() {
    return Person(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.toModel(),
      location: location.toModel(),
      image: image,
      episode: episode,
      url: url,
      created: created,
    );
  }
}
