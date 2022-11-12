import 'package:flutter/material.dart';

class SpellList extends StatelessWidget {
  const SpellList({super.key});
//TODO update
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Spells'),
      ),
      body: Center(
        child:
        ListView( //ListviewBuilder
          children:  <Widget>[
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),
            Card(
              child: spellTile('spell'),
            ),

            //TO make it scrollable just add more Titles and it will be auto scroll
          ],
        ),
      ),
    );
  }
}

ListTile spellTile(String spellName){
  return ListTile(
    leading: Icon(Icons.image),
    title: Text(spellName),
  );

}