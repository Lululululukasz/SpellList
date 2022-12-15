import 'package:flutter/material.dart';

import '../character_var.dart';

class CharacterInformationTile extends StatelessWidget {
  final String characterInfo;

  const CharacterInformationTile({Key? key, required this.characterInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        whichClass = characterInfo;
        Navigator.pushNamed(context, '/spells');
        print("test");
      }, //TODO add also handbookClasses,

      leading: Text(characterInfo),
      trailing: const Icon(Icons.keyboard_arrow_right),
      shape: const Border(bottom: BorderSide(), top: BorderSide()),
    );
  }
}
