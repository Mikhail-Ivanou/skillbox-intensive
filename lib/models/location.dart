class Location {
  final String name;
  final String? type;
  final String? dimension;
  final List<String>? residents;

  Location({
    required this.name,
    this.type,
    this.dimension,
    this.residents,
  });
}
