import 'package:flutter/material.dart';

class SpellList extends StatelessWidget {
  const SpellList({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Spells'),
      ),
      body: Center(
        child:
        ListView(
          children:  <Widget>[
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
            ),
            Card(
              child: spellTile('schpell'),
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