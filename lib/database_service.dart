//import 'package:flutter/material.dart';


//class DatabaseService {

  //final String userID;
//final CollectionReference userChars = Firestore.instance.collection('userChar');

  //Future setChar(String key, bool value) async {
    //return await userChars.document(userID).setData(
      //  {key: value}, merge: true);
  //}

  //Future deleteChar(String key) async {
    //return await userChars.document(userID).updateData({
      //key: FieldValue.delete(),
    //});
//}

  //Future checkIfUserExists() async {
    //if ((await userChars.document(userID).get()).exists) {
      //return true;
    //} else {
      //return false;
    //}
  //}
//}