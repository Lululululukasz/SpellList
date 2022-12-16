import 'package:flutter/material.dart';
import '../Firebase/collectionForCharacter.dart';
import '../globalVariables.dart';

class CharacterInformationTile extends StatelessWidget {
  final String characterInfo;

  const CharacterInformationTile({Key? key, required this.characterInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        whichClass = characterInfo;
        upload();
        Navigator.pushNamed(context, '/spells');
      },
      leading: Text(characterInfo),
      trailing: const Icon(Icons.keyboard_arrow_right),
      shape: const Border(bottom: BorderSide(), top: BorderSide()),
    );
  }
}
void upload(){
  CharacterStats clickCharacter = CharacterStats(
    characterClasses: whichClass,
    characterName: characterNames.first,
  );
  Map<String, dynamic> data = clickCharacter.toFirestore();
  db.collection("Character").add(data).then((documentSnapshot) =>
      print("Added Data with ID: ${documentSnapshot.id}"));
}