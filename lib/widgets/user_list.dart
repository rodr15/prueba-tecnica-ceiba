import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/publications.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: (() {
                    final List<Publications> publications =
                        Provider.of<WebService>(context, listen: false)
                            .FilterPublications(user.id);
                    Navigator.pushNamed(
                      context,
                      'Details',
                      arguments: {'user': user, 'publications': publications},
                    );
                  }),
                  child: const Text(
                    'VER PUBLICACIONES',
                    style: TextStyle(fontSize: 15),
                  ),
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
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Row(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.phone)),
              Text(user.phone),
            ],
          ),
          Row(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.email)),
              Text(user.email),
            ],
          ),
        ],
      ),
    );
  }
}
