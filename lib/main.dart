import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'menu.dart';
import 'spells.dart';
import 'sheet.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_core/firebase_core.dart';
//TODO
void main()


async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
      routes: {
// When navigating to the "/" route, build the FirstScreen widget
       '/login': (context) => MyLogin(),
// When navigating to the "/second" route, build the SecondScreen widget.
      '/sheet': (context) =>  const Sheet(),
      '/spells': (context) => const SpellList(),
        '/menu': (context) => const MainMenu(),
      },
      home: Scaffold(
          appBar: AppBar(
              title: Text("D&D")),
         body: MyLogin()
      )
      )
  );
  }

// Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.



class MyLogin extends StatefulWidget {
  @override
  MyLoginState createState() => MyLoginState();
}

class MyLoginState extends State<MyLogin> {
  User? user;

  final emailInput = TextEditingController(text: '');
  final passInput = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() => this.user = user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              children: [
                Column(children: [
                  SignInButton(Buttons.Email, onPressed: () => login(emailInput.text, passInput.text, context)),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    SizedBox(
                        width: 150,
                        child: TextField(controller: emailInput, decoration: InputDecoration(hintText: 'Email'))),
                    SizedBox(
                        width: 150,
                        child: TextField(
                            controller: passInput,
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'))),
                  ])
                ]),

                Center(child: userInfo()),
                OutlinedButton(
                    child: Text('Sign out', style: TextStyle(color: Colors.red)),
                    onPressed: user != null ? () => logout() : null)
              ],
            )));
  }



  Widget userInfo() {
    if (user == null)
      return Text('Not signed in.');
    else {
      User user = this.user!;
      return
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        if (user.photoURL != null) Image.network(user.photoURL!, width: 50),
        Text('Signed in as ${user.displayName != null ? user.displayName! + ', ' : ''}${user.email}.')
      ]);
    }
  }
void login (String email,String passwort,BuildContext context) async{
    if (await loginWithEmail(email, passwort) != null){
      Navigator.pushNamed(context, '/menu');
  }
}

  Future<UserCredential?> loginWithEmail(String email, String pass) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Future.value(null);
    }
  }


  logout() => FirebaseAuth.instance.signOut();
}

