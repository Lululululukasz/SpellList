import 'package:flutter/material.dart';
import 'package:mob_project/api_call.dart';
import 'dart:async';





class Spells extends StatefulWidget {
  const Spells({super.key});

  @override
  State<Spells> createState() => _SpellsState();
}

class _SpellsState extends State<Spells> {
  late Future<List<Users>> spelldata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spelldata = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Api Calls in Flutter'),
            centerTitle: true,
          ),
          body: Center(
            child: FutureBuilder<List<Users>>(
                future: spelldata,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].index),
                            subtitle: Text(snapshot.data![index].name),
                            trailing: Text(snapshot.data![index].url),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ));
  }
}

//TODO results.results needed api call is different