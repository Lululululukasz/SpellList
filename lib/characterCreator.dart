import 'package:flutter/material.dart';



class CharacterCreator extends StatefulWidget {
  const CharacterCreator({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<CharacterCreator> {
  final List<String> characterNumber = <String>[];

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

  var yourCharacterName = "";

  void addItemToList() {
    setState(() {
      characterNumber.insert(0, yourCharacterName);
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

              print(characterNumber.length); //TODO Test
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.add)),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: characterNumber.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        print("ButtonInk works"); //TODO Test
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        color: Colors.red,
                        child: Center(
                            child: Text(
                          name,
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
          actions: [TextButton(onPressed: submit, child: const Text("Create"))],
        ),
      );

  void submit() {
    Navigator.of(context).pop(controller.text);
  }
}
