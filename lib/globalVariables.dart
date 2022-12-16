//For Button iteration
import 'package:firebase_auth/firebase_auth.dart';

final List<String> handbookClasses = <String>["Barbarian","Bard","Cleric","Druid",
  "Fighter","Monk","Paladin","Ranger","Rogue","Sorcerer","Warlock","Wizard"];

//For creating a new Character
final List<String> characterNames=[];
final List<String> characterClass=[];

//For filtering spellList
String whichClass = "";


//For navigation
String spellListNavigation = "/spells";
String spellListName = "Spells";
String logoutName = "Logout";

//For login/logout
User? user;


