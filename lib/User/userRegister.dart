import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future <void> register (BuildContext context, String email, String pass) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('successfully registered'),
    ));

  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('email is already in use.'),
      ));
    } else if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('this password is too weak.'),
      ));
    }

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('unknown error'),
    ));
  }
}