import 'package:flutter/material.dart';
class CharTile extends StatelessWidget {
  final String characterName;
  const CharTile({Key? key, required this.characterName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(characterName),
      //onTap: (){

    );
  }
}
