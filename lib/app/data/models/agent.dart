class Agent {
  String name;
  List<String> languages;
  int points;
  Agent({
    required this.name,
    required this.languages,
    required this.points,
  });

  @override
  String toString() => name;
}
