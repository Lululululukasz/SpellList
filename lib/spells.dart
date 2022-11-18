import 'package:flutter/material.dart';
import 'package:mob_project/api_call.dart';
import 'dart:async';

/* TODO also create a function which filters the spells */

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
                var filteredspells = snapshot.data!.where((element) => element.name == "Aid").toList(); //Filters for aid
                return ListView.builder(
                    itemCount: filteredspells.length,
                    itemBuilder: (context, index) {

                      return ListTile(
                        title: Text(filteredspells[index].name),
                        subtitle: Text(snapshot.data![index].index),
                        // trailing: Text(snapshot.data![index].url), not needed right now
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
