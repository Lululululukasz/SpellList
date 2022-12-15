import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//If a new variable is added in the Api updated code
  class SpellList {
  String index;
  String name;
  String url;
  String characterclass;
  String desc;

  SpellList({
    required this.index,
    required this.name,
    required this.url,
    required this.characterclass,
    required this.desc,
  });

  factory SpellList.fromJson(Map<String, dynamic> json) => SpellList(
    index: json["index"],
    name: json["name"],
    url: json["url"],
    characterclass: json["characterclass"],
    desc: json["desc"],
  );
}

Future<List<SpellList>> getSpells() async {

  final response = await http.get(
    Uri.parse('https://gultendier.github.io/apidata/spells'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<SpellList> spells = [];
    for (var u in jsonResponse) {
      SpellList spell = SpellList(index: u['index'], name: u['name'], url: u['url'], characterclass: u['characterclass'], desc: u['desc']);
      spells.add(spell);
    }
    return spells;
  } else {
    throw Exception('Failed to load post');
  }
}