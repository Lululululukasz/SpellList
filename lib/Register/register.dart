import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mob_project/main.dart';

Future <void> register(String email, String pass) async {
  try {
    print(email+" "+pass);
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
class registerscreen extends StatefulWidget {
  const registerscreen({Key? key}) : super(key: key);

  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {

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
        body: Container(
          width: double.infinity,
          child: Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      " Register ",
                      style: TextStyle(fontSize: 35)
                  ),
                  // SignInButton(
                  //Buttons.Google, onPressed: (){
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    SizedBox(
                        width: 150,
                        child: TextField(controller: emailInput, decoration: InputDecoration(hintText: 'Email'))),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    SizedBox(
                        width: 150,
                        child: TextField(
                            controller: passInput,
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'))),
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
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Login'),
                  ),
                ]),
          ),
        )
    );
  }

}