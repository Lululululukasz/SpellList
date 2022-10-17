import 'package:flutter/material.dart';

class Sheet extends StatelessWidget {
  const Sheet({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Characters'),
      ),
      body: Center(
        child:
        ListView(
          children:  <Widget>[
            Card(
              child: charTile('char1'),
            ),
            Card(
              child: charTile('alsochar1'),
            ),
            //TO make it scrollable just add more Titles and it will be auto scroll
          ],
        ),
      ),
    );
  }
}
ListTile charTile(String charName){
  return ListTile(
    title: Text(charName),
  );

}
