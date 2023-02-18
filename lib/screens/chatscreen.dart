import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuu/Constants.dart';
import 'package:uuu/models/messages.dart';
import '../widgets/chat_bubble.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';
  TextEditingController controller = TextEditingController();
  CollectionReference message =
      FirebaseFirestore.instance.collection('Messages');
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var emailuser = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy('CreatedAt', descending: true).snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagelist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: KPrimaryGreen,
                  foregroundColor: kPrimaryPurple,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/PL.png', height: 50),
                      const Text(
                        'Chat',
                        style: TextStyle(color: kPrimaryPurple),
                      ),
                    ],
                  )),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagelist.length,
                        itemBuilder: (context, index) {
                          return messagelist[index].id == emailuser
                              ? chatBubble(messagelist[index])
                              : chatBubbleforFreind(messagelist[index]);
                        }),
                  ),
                  TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      message.add({
                        'Text': value,
                        'CreatedAt': DateTime.now(),
                        'id': emailuser
                      });
                      controller.clear();
                      _controller.animateTo(0,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send your message!',
                      hintStyle: const TextStyle(color: kPrimaryPurple),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: KPrimaryGreen, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: KPrimaryGreen, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: KPrimaryGreen, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: KPrimaryGreen, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ],
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
