import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WebService webService = Provider.of<WebService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de ingreso'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: webService.users.length,
        itemBuilder: (context, index) {
          return UserCard(user: webService.users[index]);
        },
      ),
    );
  }
}

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
