import 'Firebase/collectionForCharacter.dart';
import 'package:flutter/material.dart';
import 'characte_creater.dart';

class FutureCharacterSelection extends StatelessWidget {
  const FutureCharacterSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getChar();
    return FutureBuilder(
      future: getChar(),
      builder: (context,snapshot){
        if (snapshot.hasError){
          return Text (snapshot.error.toString());
        } else if(snapshot.hasData){
          List<ListTile> CharacterTiles = [];
         List<String> chars = snapshot.data as List<String>;
         chars.forEach((element) {
           CharacterTiles.add(ListTile(
             leading: Text(element),
           ));
         }
         );
          return ListView(
            children: CharacterTiles,
          );

        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
  Future getChar () async{
    List<String> characterName = [];
    final snapshot = await db.collection("Character").get();
    snapshot.docs.forEach((element) {characterName.add(element.data().values.first);}
    );
    return characterName;
  }
}
