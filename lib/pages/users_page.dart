import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';
import 'package:prueba_tecnica_ceiba/search/search_delegate.dart';
import 'package:prueba_tecnica_ceiba/widgets/user_card.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WebService webService = Provider.of<WebService>(context);
    final users = webService.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de ingreso'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () => showSearch(
                    context: context,
                    delegate: UserSearchDelegate(),
                  ),
              icon: const Icon(Icons.search))
        ],
      ),
      body: UserList(users: users),
    );
  }
}
