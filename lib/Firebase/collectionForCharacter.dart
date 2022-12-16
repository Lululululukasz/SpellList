import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
class CharacterStats
{
  final String? characterName;
  final String? characterClasses;


  CharacterStats({
    this.characterName,
    this.characterClasses,

  });
  Map<String, dynamic> toFirestore() {
    return {
      if (characterName != null) "name": characterName,
      if (characterClasses != null) "classes": characterClasses,
    };
  }
}