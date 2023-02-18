import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuu/screens/StandingScreen.dart';
import 'package:uuu/screens/chatscreen.dart';
import 'package:uuu/screens/h2h.dart';
import 'package:uuu/screens/information.dart';
import 'package:uuu/screens/loginscreen.dart';
import 'package:uuu/screens/mover.dart';
import 'package:uuu/screens/regesterscreen.dart';

import 'firebase_options.dart';

const storage = FlutterSecureStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UUU());
}

class UUU extends StatelessWidget {
  const UUU({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        MoverScreen.id: (context) => MoverScreen(),
        StandingScreen.id: (context) => StandingScreen(),
        H2HScreen.id: (context) => H2HScreen(),
        Information.id: (context) => Information()
      },
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
