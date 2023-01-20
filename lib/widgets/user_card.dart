import 'package:flutter/material.dart';

import '../models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({
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
              CardInformation(user: user),
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

class CardInformation extends StatelessWidget {
  const CardInformation({
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
