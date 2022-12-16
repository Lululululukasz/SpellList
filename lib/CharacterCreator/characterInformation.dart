import 'package:flutter/material.dart';
import 'package:mob_project/Functions/characterInformationFunction.dart';
import 'package:mob_project/globalVariables.dart';

class CharacterInformation extends StatelessWidget {
  const CharacterInformation({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> infoTiles = [];
    infoTiles.add(
      const ListTile(
        title: Text('Choose your class:'),
        shape: Border(bottom: BorderSide(), top: BorderSide()),
      ),
    );

    for (var element in handbookClasses) {
      infoTiles.add(CharacterInformationTile(characterInfo: element));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Characters'),
        ),
        body: ListView(children: infoTiles));
  }
}