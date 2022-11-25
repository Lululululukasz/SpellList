import 'package:flutter/material.dart';

import 'character_var.dart';

class Sheet extends StatelessWidget {
  const Sheet({super.key});

//TODO Update
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Characters'),
        ),
        body: ListView(
          children: [
            Container(
              height: kToolbarHeight,
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

// move this to another class
class ClassButton extends StatefulWidget {
  const ClassButton({Key? key, required this.classChosen}) : super(key: key);
  final String classChosen;

  @override
  State<ClassButton> createState() => _ClassButtonState();
}

class _ClassButtonState extends State<ClassButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: .0, right: 8.0),
      child: ElevatedButton(
        // Within the `FirstScreen` widget
        onPressed: () {
          // Navigate to the second screen using a named route.
          whichClass = widget.classChosen;
          Navigator.pushNamed(context, '/spells');
        },
        child: Text(widget.classChosen),
      ),
    );
  }
}
