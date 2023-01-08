import 'dart:convert';

import 'package:http/http.dart' as http;

class Users {
  String name;
  int icu;

  Users({required this.name, required this.icu});

  factory Users.fromJson(Map<String, dynamic> json) =>
      Users(name: json["name"], icu: json["ICU_bed"]);
}

Future<List<Users>> getUsers(int s) async {
  String x = s.toString();
  final response = await http.get(
    Uri.parse('http://192.168.1.27:8000/api/hospitalview'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<Users> users = [];
    for (var u in jsonResponse) {
      Users user = Users(name: u['name'], icu: u['ICU_bed']);
      users.add(user);
    }
    return users;
  } else {
    throw Exception('Failed to load post');
  }
}

Future<Map<String, dynamic>> getUser(int s) async {
  final response = await http.get(
    Uri.parse('http://192.168.1.27:8000/api/hospitalview$s'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    Map<String, dynamic> users = {"ICU_bed": 0};
    for (var u in jsonResponse) {
      users["ICU_bed"] = u['ICU_bed'];
    }
    return users;
  } else {
    throw Exception('Failed to load post');
  }
}
