import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//WHY THE FUCK CANT I RENAME USERS
class SpellList {
  String index;
  String name;
  String url;

  SpellList({
    required this.index,
    required this.name,
    required this.url,
  });

  factory SpellList.fromJson(Map<String, dynamic> json) => SpellList(
        index: json["index"],
        name: json["name"],
        url: json["url"],
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
      SpellList spell = SpellList(index: u['index'], name: u['name'], url: u['url']);
      spells.add(spell);
    }
    return spells;
  } else {
    throw Exception('Failed to load post');
  }
}
