import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uuu/Constants.dart';

class CostumFormField extends StatelessWidget {
  CostumFormField(
      {required this.hintText, required this.protect, required this.onchanged});
  String hintText;
  Function(String) onchanged;
  bool protect = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is requierd';
          }
        },
        onChanged: onchanged,
        obscureText: protect,
        decoration: InputDecoration(
            hintText: '$hintText',
            hintStyle: const TextStyle(color: kPrimaryPurple),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryPurple, width: 4),
                borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryPurple, width: 4),
                borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryPurple, width: 4),
                borderRadius: BorderRadius.circular(25)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryPurple, width: 4),
                borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
