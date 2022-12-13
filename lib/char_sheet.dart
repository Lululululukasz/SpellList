import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
class Character_stats
{
  final String? characterName;
  final String? classes;
  final int? level;



  Character_stats({
    this.characterName,
    this.classes,
    this.level,

  });


  factory Character_stats.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Character_stats(
      characterName: data?['name'],
      classes: data?['classes'],
      level: data?['level'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (characterName != null) "name": characterName,
      if (classes != null) "classes": classes,
      if (level != null) "level": level,
    };
  }
}