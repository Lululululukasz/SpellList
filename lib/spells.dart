import 'package:flutter/material.dart';
import 'package:mob_project/api_call.dart';
import 'dart:async';

/* TODO find out how the fuck you can rename Users without killing code
   TODO also create a function which filters the spells */

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
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
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
