import 'package:flutter/material.dart';
class charTile extends StatelessWidget {
  final String characterName;
  const charTile({Key? key, required this.characterName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(characterName),
      //onTap: (){

    );
  }
}
