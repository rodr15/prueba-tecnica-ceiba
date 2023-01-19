import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';

import 'package:http/http.dart' as http;

class WebService extends ChangeNotifier {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final List<User> users = [];
  bool isLoading = true;
  late Box<User> userStorage;
  WebService() {
    _loadUsers();
  }

  Future _loadUsers() async {
    userStorage = Hive.box<User>('users');
    if (userStorage.isEmpty) {
      final usersResponse = await http.get(Uri.parse('$_baseUrl/users'));
      if (usersResponse.statusCode == 200) {
        List usersRawList = jsonDecode(usersResponse.body);

        for (Map<String, dynamic> userRaw in usersRawList) {
          final User user = User.fromMap(userRaw);
          userStorage.put(user.id, user);
        }
        userStorage.values.toList().forEach((element) {
          print(element.name);
        });
      } else {
        throw Exception('Failed to load ');
      }
    }
  }
}
