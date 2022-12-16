import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


Future <void> register(String email, String pass) async {
  try {
    print("$email $pass");
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );

    print(FirebaseAuth.instance.currentUser);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  User? user;
  final emailInput = TextEditingController(text: '');
  final passInput = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() => this.user = user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: SizedBox(
          width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                      "Register",
                      style: TextStyle(fontSize: 35)
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    SizedBox(
                        width: 150,
                        child: TextField(
                            controller: emailInput,
                            decoration: const InputDecoration(hintText: 'Email'))),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    SizedBox(
                        width: 150,
                        child: TextField(
                            controller: passInput,
                            obscureText: true,
                            decoration: const InputDecoration(hintText: 'Password'))),
                  ]),
                  SignInButton(
                      Buttons.Email,
                      text:'Register',
                      onPressed: () {
                        register(emailInput.text, passInput.text).then((value) {
                          if (user != null) {
                            Navigator.pushNamed(context, '/menu');
                          }
                        });
                      }
                  ),
                ]
            ),

        )
    );
  }

}