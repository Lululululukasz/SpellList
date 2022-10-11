import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context)  {
    const title = 'Basic List';

    return MaterialApp (
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spells'),
          backgroundColor: Colors.blue,
          //centerTitle: true, to center title
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              title: Text('a'),
              textColor: Colors.red,
            ),
            ListTile(
              title: Text('b'),
              textColor: Colors.blue,
            ),
            ListTile(
              title: Text('c'),
              textColor: Colors.brown,
            ),
            ListTile(
              title: Text('d'),
              textColor: Colors.green,
            ),
            ListTile(
              title: Text('e'),
              textColor: Colors.blue,
            ),
            ListTile(
              title: Text('f'),
              textColor: Colors.blue,
            ),
            ListTile(
              title: Text('g'),
              textColor: Colors.blue,
            ),
            ListTile(
              title: Text('h'),
              textColor: Colors.blue,
            ),
            ListTile(
              title: Text('i'),
              textColor: Colors.blue,
            ),
            ListTile(
              title: Text('j'),
              textColor: Colors.blue,
            ),ListTile(
              title: Text('k'),
              textColor: Colors.pink,
            ),ListTile(
              title: Text('l'),
              textColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}