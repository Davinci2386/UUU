// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuu/Constants.dart';
import 'package:uuu/models/stand.dart';
import 'package:uuu/widgets/standwidget.dart';

class StandingScreen extends StatelessWidget {
  StandingScreen({super.key});
  static String id = 'StandingScreen';
  CollectionReference standing =
      FirebaseFirestore.instance.collection('Standing');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: standing.orderBy('Rank').snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Stand> standlist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              standlist.add(Stand.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: kPrimaryPurple,
                  foregroundColor: KPrimaryGreen,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/PL.png',
                          height: 50, color: KPrimaryGreen),
                      const Text(
                        'Standing!',
                        style: TextStyle(color: KPrimaryGreen),
                      ),
                    ],
                  )),
              body: ListView.builder(
                reverse: false,
                itemCount: standlist.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        StandWidget(
                          color: Colors.cyan,
                          name: standlist[index].name,
                          rank: standlist[index].Rank,
                          points: standlist[index].points,
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.black,
                          thickness: 2,
                        )
                      ],
                    );
                  } else if (index == 1) {
                    return Column(
                      children: [
                        StandWidget(
                          color: Colors.yellow,
                          name: standlist[index].name,
                          rank: standlist[index].Rank,
                          points: standlist[index].points,
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.black,
                          thickness: 2,
                        )
                      ],
                    );
                  } else if (index == 2) {
                    return Column(
                      children: [
                        StandWidget(
                          color: Colors.grey,
                          name: standlist[index].name,
                          rank: standlist[index].Rank,
                          points: standlist[index].points,
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.black,
                          thickness: 2,
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        StandWidget(
                          color: KPrimaryGreen,
                          name: standlist[index].name,
                          rank: standlist[index].Rank,
                          points: standlist[index].points,
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.black,
                          thickness: 2,
                        )
                      ],
                    );
                  }
                },
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                  child: Text(
                'Loading..!',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
            );
          }
        }));
  }
}
