import 'package:flutter/material.dart';
import 'package:mob_project/api_call.dart';
import 'dart:async';
//following import is just used for a test will change later
import 'package:mob_project/character_var.dart';

class Spells extends StatefulWidget {
  const Spells({super.key});

  @override
  State<Spells> createState() => _SpellsState();
}

class _SpellsState extends State<Spells> {
  late Future<List<SpellList>> spelldata;

  @override
  void initState() {
    super.initState();
    spelldata = getSpells();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spells'),
      ),
      body: Center(
        child: FutureBuilder<List<SpellList>>(
            future: spelldata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                /* variable from character_var it filters for the class
                 TODO make it that it filters classes from sheet */
                var filteredSpell = snapshot.data!.where((element) => element.characterclass.contains(whichClass)).toList();
                return ListView.builder(
                    itemCount: filteredSpell.length,
                    itemBuilder: (context, index) {

                      return ExpansionTile(
                        title: Text(filteredSpell[index].name),
                        subtitle: Text(filteredSpell[index].characterclass),

                        children: <Widget>[
                          ListTile(
                            title: Text(filteredSpell[index].desc),
                          )
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
