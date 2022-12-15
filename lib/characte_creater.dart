import 'package:flutter/material.dart';
import 'package:mob_project/Firebase/collectionForCharacter.dart';
import 'package:mob_project/future_char_selecter.dart';



class CharacterCreator extends StatefulWidget {
  const CharacterCreator({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<CharacterCreator> {
  final List<String> characterNames=[];

  late TextEditingController controller;
  String name = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addItemToList() {
    setState(() {
      characterNames.insert(0, name); //insert instantz der klasse insert new
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Characters'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final name = await nameYourCharacter();
              setState(() => this.name = name!);
              addItemToList();
              upload();
              print(characterNames.length); //TODO Test
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.add)),
        body: Column(children: <Widget>[
          Expanded(
              child: FutureCharacterSelection(),
          )
        ]));
  }

  Future<String?> nameYourCharacter() => showDialog<String?>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Your Character Name"),
      content: TextField(
        autofocus: true,
        decoration:
        const InputDecoration(hintText: "Enter your Characters Name"),
        controller: controller,
      ),
      actions: [
        TextButton(
            onPressed: submit,
            child: const Text("Create"))],
    ),
  );

  void submit() {
    Navigator.of(context).pop(controller.text);

     }
  void upload(){
    Character_stats clickCharacter = Character_stats(
        characterName: characterNames.first);
    Map<String, dynamic> data = clickCharacter.toFirestore();
    db.collection("Character").add(data).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
  }

}
