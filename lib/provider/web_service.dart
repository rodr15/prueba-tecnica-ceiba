import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:prueba_tecnica_ceiba/models/publications.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';

import 'package:http/http.dart' as http;

class WebService extends ChangeNotifier {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  List<User> users = [];
  List<Publications> publications = [];
  bool isLoading = true;
  late Box<User> userStorage;
  late Box<Publications> publicationsStorage;
  WebService() {
    _loadUsers();
    _loadPublications();
    isLoading = false;
    notifyListeners();
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
      } else {
        throw Exception('Failed to load ');
      }
    }
    users = userStorage.values.toList();
  }

  Future _loadPublications() async {
    publicationsStorage = Hive.box<Publications>('publications');
    if (publicationsStorage.isEmpty) {
      final publicationsResponse = await http.get(Uri.parse('$_baseUrl/posts'));
      if (publicationsResponse.statusCode == 200) {
        List publicationsRawList = jsonDecode(publicationsResponse.body);

        for (Map<String, dynamic> publicationsRaw in publicationsRawList) {
          final Publications publication =
              Publications.fromMap(publicationsRaw);
          publicationsStorage.put(publication.id, publication);
        }
      } else {
        throw Exception('Failed to load ');
      }
    }
    publications = publicationsStorage.values.toList();
  }

  String capitalize(String s) =>
      s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1).toLowerCase();

  List<User> FilterUsers(String query) {
    List<User> filteredUsers = userStorage.values
        .where((user) => user.name.contains(capitalize(query)))
        .toList();
    return filteredUsers;
  }

  List<Publications> FilterPublications(int userId) {
    List<Publications> filteredPublications = publicationsStorage.values
        .where((publications) => publications.userId == userId)
        .toList();
    return filteredPublications;
  }
}
