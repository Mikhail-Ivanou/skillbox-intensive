class Episode {
  final int id;
  final String name;
  final String? airDate;
  final String? episode;
  final List<String>? characters;

  Episode({
    required this.id,
    required this.name,
    this.airDate,
    this.episode,
    this.characters,
  });
}
