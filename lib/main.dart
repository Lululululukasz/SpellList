import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spells'),
          backgroundColor: Colors.red,
          //centerTitle: true, to center title
        ),
        body: ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spell'),
              ),
            ),
              //TO make it scrollable just add more Titles and it will be auto scroll
          ],
        ),
      ),
    );
  }
}
