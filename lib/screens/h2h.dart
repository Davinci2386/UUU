import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuu/Constants.dart';
import 'package:uuu/models/h2hstand.dart';
import 'package:uuu/widgets/h2hWidget.dart';

// ignore: must_be_immutable
class H2HScreen extends StatelessWidget {
  H2HScreen({super.key});
  static String id = 'H2HScreen';
  CollectionReference h2h = FirebaseFirestore.instance.collection('H2H');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: h2h.orderBy('Rank').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<H2HStand> h2hstand = [];
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              h2hstand.add(H2HStand.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  foregroundColor: KPrimaryGreen,
                  backgroundColor: kPrimaryPurple,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/PL.png',
                        height: 50,
                        color: KPrimaryGreen,
                      ),
                      const Text(
                        'H2H!',
                        style: TextStyle(color: KPrimaryGreen),
                      )
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Container(
                        color: KPrimaryGreen,
                        height: 50,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 35,
                              child: Text(
                                'Rank',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 100,
                              child: Center(
                                  child: Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 35,
                              child: Center(
                                child: Text(
                                  'P',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 35,
                              child: Center(
                                child: Text(
                                  'W',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 25,
                              child: Center(
                                  child: Text(
                                'D',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 35,
                              child: Center(
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            Center(
                              child: Text(
                                'Pts',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                      child: ListView.builder(
                        itemCount: h2hstand.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                              children: [
                                H2hWidget(
                                    played: h2hstand[index].played,
                                    name: h2hstand[index].name,
                                    rank: h2hstand[index].rank,
                                    color: Colors.cyan,
                                    draws: h2hstand[index].draws,
                                    loses: h2hstand[index].loses,
                                    points: h2hstand[index].wins * 3 +
                                        h2hstand[index].draws,
                                    wins: h2hstand[index].wins),
                                const Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  height: 2,
                                )
                              ],
                            );
                          } else if (index == 1) {
                            return Column(
                              children: [
                                H2hWidget(
                                    played: h2hstand[index].played,
                                    name: h2hstand[index].name,
                                    rank: h2hstand[index].rank,
                                    color: Colors.yellow,
                                    draws: h2hstand[index].draws,
                                    loses: h2hstand[index].loses,
                                    points: h2hstand[index].wins * 3 +
                                        h2hstand[index].draws,
                                    wins: h2hstand[index].wins),
                                const Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  height: 2,
                                )
                              ],
                            );
                          } else if (index == 2) {
                            return Column(
                              children: [
                                H2hWidget(
                                    played: h2hstand[index].played,
                                    name: h2hstand[index].name,
                                    rank: h2hstand[index].rank,
                                    color: Colors.grey,
                                    draws: h2hstand[index].draws,
                                    loses: h2hstand[index].loses,
                                    points: h2hstand[index].wins * 3 +
                                        h2hstand[index].draws,
                                    wins: h2hstand[index].wins),
                                const Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  height: 2,
                                )
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                H2hWidget(
                                    played: h2hstand[index].played,
                                    name: h2hstand[index].name,
                                    rank: h2hstand[index].rank,
                                    color: KPrimaryGreen,
                                    draws: h2hstand[index].draws,
                                    loses: h2hstand[index].loses,
                                    points: h2hstand[index].wins * 3 +
                                        h2hstand[index].draws,
                                    wins: h2hstand[index].wins),
                                const Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  height: 2,
                                )
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ));
          } else {
            return const Scaffold(
              body: Center(
                  child: Text(
                'Loading..!',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
            );
          }
        });
  }
}
