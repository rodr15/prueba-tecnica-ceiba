import 'package:flutter/material.dart';

import '../models/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';
import 'package:prueba_tecnica_ceiba/search/search_delegate.dart';
import 'package:prueba_tecnica_ceiba/widgets/user_list.dart';

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return _UserCard(user: users[index]);
      },
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _CardInformation(user: user),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text(
                  'VER PUBLICACIONES',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardInformation extends StatelessWidget {
  const _CardInformation({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: const TextStyle(color: Colors.green, fontSize: 20),
          ),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.green,
              ),
              Text(user.phone),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.email,
                color: Colors.green,
              ),
              Text(user.email),
            ],
          ),
        ],
      ),
    );
  }
}
