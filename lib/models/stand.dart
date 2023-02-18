class Stand {
  final String name;
  final int points;
  final int Rank;
  Stand({required this.name, required this.points, required this.Rank});
  factory Stand.fromjson(data) {
    return Stand(
        name: data['Name'], points: data['Points'], Rank: data['Rank']);
  }
}
