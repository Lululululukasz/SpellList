import 'package:flutter/material.dart';

import '../characterVar.dart';

class CharacterInformationTile extends StatelessWidget {
  final String characterInfo;

  const CharacterInformationTile({Key? key, required this.characterInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        whichClass = characterInfo; //TODO this should save whichClass = characterInfo for this specific class
        Navigator.pushNamed(context, '/spells');
        print("Test for CharacterInformation");
      }, //TODO add also handbookClasses,

      leading: Text(characterInfo),
      trailing: const Icon(Icons.keyboard_arrow_right),
      shape: const Border(bottom: BorderSide(), top: BorderSide()),
    );
  }
}
