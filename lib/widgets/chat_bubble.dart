import 'package:flutter/material.dart';
import 'package:uuu/models/messages.dart';

import '../Constants.dart';

class chatBubble extends StatelessWidget {
  chatBubble(
    this.m,
  );
  Message m;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: const BoxDecoration(
            color: kPrimaryPurple,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child: Text(
          m.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class chatBubbleforFreind extends StatelessWidget {
  chatBubbleforFreind(
    this.m,
  );

  Message m;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: const BoxDecoration(
                color: KPrimaryGreen,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  m.id.split('@')[0],
                  style: const TextStyle(
                      color: kPrimaryPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ('\n${m.message}'),
                  style: const TextStyle(color: kPrimaryPurple, fontSize: 16),
                ),
              ],
            )));
  }
}
