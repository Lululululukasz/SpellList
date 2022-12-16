import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
class Character_stats
{
  final String? characterName;
  final String? characterClasses;



  Character_stats({
    this.characterName,
    this.characterClasses,

  });


  factory Character_stats.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Character_stats(
      characterName: data?['name'],
      characterClasses: data?['classes'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (characterName != null) "name": characterName,
      if (characterClasses != null) "classes": characterClasses,
    };
  }
}