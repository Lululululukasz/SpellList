import 'package:flutter/material.dart';

import 'character_var.dart';

class Sheet extends StatelessWidget {
  const Sheet({super.key});

//TODO FIX THIS UGLY SHIT OF CODE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Characters'),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: kToolbarHeight,
              // child: Text("Choose your Class:"), add a text but its ugly

            ),
            ClassButton(classChosen: barbarian),
            ClassButton(classChosen: bard),
            ClassButton(classChosen: cleric),
            ClassButton(classChosen: druid),
            ClassButton(classChosen: fighter),
            ClassButton(classChosen: monk),
            ClassButton(classChosen: paladin),
            ClassButton(classChosen: ranger),
            ClassButton(classChosen: rogue),
            ClassButton(classChosen: sorcerer),
            ClassButton(classChosen: warlock),
            ClassButton(classChosen: wizard),
          ],
        ));
  }
}

//TODO move this to it own class => Style file or remove it but don't know. Cause drop down
class ClassButton extends StatefulWidget {
  const ClassButton({Key? key, required this.classChosen}) : super(key: key);
  final String classChosen;

  @override
  State<ClassButton> createState() => _ClassButtonState();
}

class _ClassButtonState extends State<ClassButton> {
  @override
  Widget build(BuildContext context) {

    return TextButton(
      // Within the `FirstScreen` widget
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        alignment: Alignment.centerLeft,

      ),
      onPressed: () {
        // Navigate to the second screen using a named route.
        whichClass = widget.classChosen;
        Navigator.pushNamed(context, '/spells');
      },
      child: Text(widget.classChosen),
    );

  }
}