import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Constants.dart';

class CostumButton extends StatelessWidget {
  CostumButton({required this.text, required this.color, required this.onTap});
  String text;
  Color color;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryPurple, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(color: color, fontSize: 22),
          ),
        ),
        width: double.infinity,
        height: 67,
      ),
    );
  }
}
