import 'package:flutter/material.dart';

class H2hWidget extends StatelessWidget {
  H2hWidget(
      {super.key,
      required this.played,
      required this.name,
      required this.rank,
      required this.color,
      required this.draws,
      required this.loses,
      required this.points,
      required this.wins});
  int rank;
  String name;
  Color color;
  int played, wins, points, draws, loses;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(children: [
        SizedBox(
          width: 35,
          child: Center(
            child: Text(
              '$rank',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 2,
          color: Colors.black,
        ),
        SizedBox(
          width: 100,
          child: Text(
            name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const VerticalDivider(
          thickness: 2,
          color: Colors.black,
        ),
        SizedBox(
          width: 35,
          child: Text(
            '$played',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        const VerticalDivider(
          thickness: 2,
          color: Colors.black,
        ),
        SizedBox(
          width: 35,
          child: Text(
            '$wins',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        const VerticalDivider(
          thickness: 2,
          color: Colors.black,
        ),
        SizedBox(
          width: 25,
          child: Text(
            '$draws',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        const VerticalDivider(
          thickness: 2,
          color: Colors.black,
        ),
        SizedBox(
          width: 35,
          child: Text(
            '$loses',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        const VerticalDivider(
          thickness: 2,
          color: Colors.black,
        ),
        Text(
          '$points',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
