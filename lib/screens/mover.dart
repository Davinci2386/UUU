import 'package:flutter/material.dart';
import 'package:uuu/Constants.dart';
import 'package:uuu/screens/StandingScreen.dart';
import 'package:uuu/screens/chatscreen.dart';
import 'package:uuu/screens/h2h.dart';
import 'package:uuu/screens/information.dart';

class MoverScreen extends StatelessWidget {
  const MoverScreen({super.key});
  static String id = 'mover';
  @override
  Widget build(BuildContext context) {
    var emailuser = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: KPrimaryPink,
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Information.id);
                },
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: kPrimaryPurple,
                  child: CircleAvatar(
                    backgroundColor: KPrimaryGreen,
                    radius: 80,
                    child: Image.asset('assets/images/PL.png', height: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ChatScreen.id,
                        arguments: emailuser);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: KPrimaryGreen),
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      'Chat Section',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, StandingScreen.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryPurple),
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'Standing for Classic',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, H2HScreen.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryPurple),
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'Standing for H2H',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
