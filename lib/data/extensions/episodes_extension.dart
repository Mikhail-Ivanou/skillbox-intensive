import 'package:rick_and_morty/data/dto/episodes_response.dart';
import 'package:rick_and_morty/models/episode.dart';

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
