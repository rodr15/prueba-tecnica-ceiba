import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:prueba_tecnica_ceiba/models/user.dart';

class WebService extends ChangeNotifier {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final List<User> users = [];
  bool isLoading = true;

  WebService() {
    _loadUsers();
  }

  Future _loadUsers() async {
    final usersResponse = await http.get(Uri.parse('$_baseUrl/users'));
    if (usersResponse.statusCode == 200) {
      List usersRawList = jsonDecode(usersResponse.body);
      for (Map<String, dynamic> userRaw in usersRawList) {
        final User user = User.fromMap(userRaw);
        users.add(user);
      }
    } else {
      throw Exception('Failed to load ');
    }
  }
}
