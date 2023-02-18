import 'package:flutter/material.dart';
import 'package:uuu/Constants.dart';

class Information extends StatelessWidget {
  static String id = 'Information';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryPurple,
        appBar: AppBar(
            foregroundColor: kPrimaryPurple,
            title: const Text(
              'About Us',
              style: TextStyle(
                  color: kPrimaryPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            backgroundColor: KPrimaryGreen),
        body: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Center(
                child: Text(
              'Leagues Winners:\n',
              style: TextStyle(color: KPrimaryGreen, fontSize: 25),
            )),
            Image.asset('assets/images/crown.png', height: 100),
            const Spacer(
              flex: 2,
            ),
            const Text(
              'World Cup Fantasy Winner:\n',
              style: TextStyle(color: KPrimaryGreen, fontSize: 25),
            ),
            const Text(
              'Mohamad Nour Abd AlHak',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 3,
            ),
            const Text(
              'World Cup Predections League:\n',
              style: TextStyle(color: KPrimaryGreen, fontSize: 25),
            ),
            const Text(
              'Ram Khadro',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 18,
            ),
            const Center(
                child: Text(
              'Davinci ®™',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
            const Spacer(
              flex: 1,
            )
          ],
        ));
  }
}
