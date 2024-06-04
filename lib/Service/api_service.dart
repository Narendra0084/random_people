import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:random_people/Module/people_objectbox.dart';

class ApiService {
  static const String apiUrl = 'https://randomuser.me/api/';

  Future<List<People>> fetchUsers(int count) async {
    final response = await http.get(Uri.parse('$apiUrl?results=$count'));

    if (response.statusCode == 200) {
      List<People> users = [];
      var data = json.decode(response.body)['results'];
      for (var user in data) {
        users.add(People(
          firstName: user['name']['first'],
          lastName: user['name']['last'],
          age: DateTime.now().year - DateTime.parse(user['dob']['date']).year,
        ));
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
