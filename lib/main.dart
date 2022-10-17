import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'DND',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MainMenu(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/character': (context) => const Characters.Characters(),
        '/spells': (context) => const SpellList(),
      },
    ),
  );
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(


          child:  ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  height: 50,
                  color: Colors.blue,
                  child:
                  ElevatedButton(
                    // Within the `FirstScreen` widget
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/character');
                    },
                    child: const Text('Characters'),
                  ),

                ),
                Container(
                  child:
                  ElevatedButton(
                    onPressed:(){
                      Navigator.pushNamed(context, '/spells');
                    },
                    child: const Text('Spells'),
                  ),
                )
              ],
            )


      ),

      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/character');
                },
                child: const Text('Characters'),
              ),
              ElevatedButton(
                onPressed:(){
                  Navigator.pushNamed(context, '/spells');
                },
                child: const Text('Spells'),
              ),
            ],
          )
      ),
    );
  }
}

class Characters extends StatelessWidget {
  const Characters.Characters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class SpellList extends StatelessWidget {
  const SpellList({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Spells'),
      ),
      body: Center(
        child:
        ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('Spells'),
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
