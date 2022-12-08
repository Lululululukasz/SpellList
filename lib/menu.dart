import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});


  logout() => FirebaseAuth.instance.signOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            height: kToolbarHeight,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/sheet');
              },
              child: const Text('Characters'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/spells');
              },
              child: const Text('Spells'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                logout();
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      )),
    );
  }
}

