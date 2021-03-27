import 'package:flutter_2_app/data/dto/episodes_response.dart';
import 'package:flutter_2_app/models/episode.dart';

extension EpisodesExtension on EpisodesResponse {
  Episode toModel() {
    return Episode(
      id: id,
      name: name,
      airDate: airDate,
      characters: characters,
      episode: episode,
    );
  }
}
