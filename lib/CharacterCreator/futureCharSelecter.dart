import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mob_project/globalVariables.dart';
import '../Firebase/collectionForCharacter.dart';
import 'package:flutter/material.dart';
import 'characteCreator.dart';
import 'package:mob_project/Firebase/collectionForCharacter.dart';

class UserInformation extends StatefulWidget {
  @override
  FutureCharacterSelection createState() => FutureCharacterSelection();
}

class FutureCharacterSelection extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('Character').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
            Map<String, dynamic> data =
            document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['name']),
              subtitle: Text(data['classes']),
            );
          })
              .toList()
              .cast(),
        );
      },
    );
  }
}