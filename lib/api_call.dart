import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Users {
  String index;
  String name;
  String url;
  Users({
    required this.index,
    required this.name,
    required this.url,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    index: json["index"],
    name: json["name"],
    url: json["url"],
  );
}

Future<List<Users>> getUsers() async {
  final response = await http.get(
    Uri.parse('https://gultendier.github.io/apidata/spells'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<Users> users = [];
    for (var u in jsonResponse) {
      Users user =
      Users(index: u['index'], name: u['name'], url: u['url']);
      users.add(user);
    }
    return users;
  } else {
    throw Exception('Failed to load post');
  }
}

