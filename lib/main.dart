import 'package:flutter/material.dart';
import 'spells.dart';
import 'sheet.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'DND',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      theme: ThemeData(
      brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MainMenu(),
        // When navigaconstting to the "/second" route, build the SecondScreen widget.
        '/sheet': (context) =>  const Sheet(),
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
      ),
      drawer: Drawer(

          child:  ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                  child:
                  ElevatedButton(
                    // Within the `FirstScreen` widget
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/sheet');
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
                  Navigator.pushNamed(context, '/sheet');
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

