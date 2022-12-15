import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mob_project/character_var.dart';

//TODO THIS CODE IS DUMB, IT SHOULDN'T EXIST, take this and sheet and characterCreator

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  logout() => FirebaseAuth.instance.signOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            height: kToolbarHeight,
          ),
          DrawerButton(
            navigationRoute: characterCreator,
            navigationName: characterCreatorName,
          ),
          DrawerButton(
            navigationRoute: sheet,
            navigationName: sheetName,
          ),
          DrawerButton(
            navigationRoute: spells,
            navigationName: spellsName,
          ),
          DrawerButton(
            navigationRoute: "/characterInformation",
            navigationName: "INFOS",
          ),
        ],
      )),
    );
  }
}

//TODO move this to it own class => Style file
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, widget.navigationRoute);
        },
        child: Text(widget.navigationName),
      ),
    );
  }
}
