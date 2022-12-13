import 'package:flutter/material.dart';
import 'package:mob_project/char_sheet.dart';

//TODO THIS IS BUGGY AS HELL DON'T TOUCH TOO HARD

class CharacterCreator extends StatefulWidget {
  const CharacterCreator({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<CharacterCreator> {
  final List<String> characterNames = <String>[];

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

              print(characterNames.length); //TODO Test
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.add)),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: characterNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        print('${characterNames[index]} ',); //TODO Test

                        Charakter_stats clickCharacter = Charakter_stats(characterName: characterNames[index]);
                        Map<String, dynamic> data = clickCharacter.toFirestore();
                        db.collection("Charakter").add(data).then((documentSnapshot)=>print ("Added Data with ID: ${documentSnapshot.id}"));
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        color: Colors.red,
                        child: Center(
                            child: Text(
                                '${characterNames[index]} ',
                              style: const TextStyle(fontSize: 18),
                        )),
                      ),
                    );
                  }))
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
}
