class H2HStand {
  H2HStand(
    this.rank,
    this.played,
    this.wins,
    this.draws,
    this.loses,
    this.name,
  );
  int rank, wins, draws, loses, played;
  String name;
  factory H2HStand.fromJson(jsonData) {
    return H2HStand(jsonData['Rank'], jsonData['Played'], jsonData['Wins'],
        jsonData['Draws'], jsonData['Loses'], jsonData['Name']);
  }
}
