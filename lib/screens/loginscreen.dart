import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuu/screens/regesterscreen.dart';
import 'package:uuu/widgets/costumButton.dart';
import 'package:uuu/widgets/costumTextField.dart';
import '../Constants.dart';
import '../helper/showSnackBar.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;

  String? email, password;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: KPrimaryGreen,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(children: [
              Container(
                  height: 180, child: Image.asset('assets/images/PL.png')),
              const Center(
                child: Text(
                  'UUU',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: kPrimaryPurple,
                      fontSize: 40),
                ),
              ),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: kPrimaryPurple,
                      fontSize: 28),
                ),
              ),
              CostumFormField(
                onchanged: (e) {
                  email = e;
                },
                hintText: 'Email',
                protect: false,
              ),
              CostumFormField(
                onchanged: (p) {
                  password = p;
                },
                hintText: 'Password',
                protect: true,
              ),
              CostumButton(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    isloading = true;
                    setState(() {});
                  }
                  try {
                    await loginUser();
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, 'mover', arguments: email);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showSnackBar(context, 'User is not found');
                    } else if (e.code == 'wrong-password') {
                      showSnackBar(context, 'Check your password!');
                    }
                  } catch (e) {
                    showSnackBar(context, 'Error!');
                  }
                  isloading = false;
                  setState(() {});
                },
                text: 'Login',
                color: KPrimaryGreen,
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: kPrimaryPurple, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    child: const Text(
                      "Register now!",
                      style: TextStyle(color: kPrimaryPurple, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);

    await storage.write(key: 'uid', value: user.user?.uid);
    await storage.write(key: 'email', value: email);
  }
}

Future<bool> checkLogin() async {
  String? value = await storage.read(key: 'uid');
  if (value == null) {
    return false;
  } else {
    return true;
  }
}
