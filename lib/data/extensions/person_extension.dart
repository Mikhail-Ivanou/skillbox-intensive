import 'package:rick_and_morty/data/dto/person_response.dart';
import 'package:rick_and_morty/models/person.dart';
import 'package:rick_and_morty/data/extensions/location_extension.dart';

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
