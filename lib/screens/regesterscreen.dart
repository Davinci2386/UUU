import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuu/screens/loginscreen.dart';
import '../Constants.dart';
import '../helper/showSnackBar.dart';
import '../widgets/costumButton.dart';
import '../widgets/costumTextField.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? userName;
  String? email, password;

  bool isloading = false;

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
                  'Register',
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
                    setState(() {});
                    isloading = true;
                    try {
                      await registerUser();
                      showSnackBar(context, 'registration completed');
                      Navigator.pushNamed(context, LoginScreen.id,
                          arguments: userName);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showSnackBar(context, 'The password is too weak');
                      } else if (e.code == 'email-already-in-use') {
                        showSnackBar(context, 'The email is already in use');
                      }
                    } catch (ex) {
                      showSnackBar(context, 'Error!');
                    }
                    isloading = false;
                    setState(() {});
                  }
                },
                text: 'Register',
                color: KPrimaryGreen,
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: kPrimaryPurple, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id,
                          arguments: userName);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: kPrimaryPurple,
                        fontSize: 18,
                      ),
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

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
