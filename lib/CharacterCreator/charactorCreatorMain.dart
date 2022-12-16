import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mob_project/CharacterCreator/futureCharSelector.dart';
import 'package:mob_project/globalVariables.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<MainMenu> {
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
      characterNames.insert(0, name);
    });
  }

  logout() => FirebaseAuth.instance.signOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Characters'),
        ),
        drawer: Drawer(
            child: ListView(
              children: [
                Container(
                  height: kToolbarHeight,
                ),
                DrawerButton(
                  navigationRoute: spellListNavigation,
                  navigationName: spellListName,
                ),
                DrawerButton(navigationRoute: "/",
                    navigationName: logoutName)
              ],
            )),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final name = await nameYourCharacter();
              setState(() => this.name = name!);
              addItemToList();
              print(characterNames.length);
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.add)
        ),
        body: Column(children: const <Widget>[
          Expanded(
            child: UserInformation(),
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
            child: const Text("Create")
        )
      ],
    ),
  );

  void submit() {
    Navigator.of(context).pop(controller.text);
    Navigator.pushNamed(context, "/characterInformation");
  }
}

class DrawerButton extends StatefulWidget {
  const DrawerButton({
    Key? key,
    required this.navigationRoute,
    required this.navigationName,
  }) : super(key: key);
  final String navigationRoute;
  final String navigationName;

  @override
  State<DrawerButton> createState() => _ClassButtonState();
}

class _ClassButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, widget.navigationRoute);
        if(widget.navigationRoute == "/") {
          FirebaseAuth.instance.signOut();
        }
      },

      leading: Text(widget.navigationName),
      shape: const Border(bottom: BorderSide(), top: BorderSide()),
    );
  }
}
