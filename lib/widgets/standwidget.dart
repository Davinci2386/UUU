import 'package:flutter/material.dart';

class StandWidget extends StatelessWidget {
  StandWidget(
      {required this.rank,
      required this.color,
      required this.name,
      required this.points});
  String name;
  int rank, points;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            '$rank',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 2,
          ),
          const VerticalDivider(
            color: Colors.black,
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                '$name',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const VerticalDivider(
            color: Colors.black,
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            '$points',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
