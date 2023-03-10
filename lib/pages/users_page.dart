import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';
import 'package:prueba_tecnica_ceiba/search/search_delegate.dart';

import '../widgets/user_list.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WebService webService = Provider.of<WebService>(context);
    final users = webService.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de ingreso'),
        actions: [
          IconButton(
              onPressed: () => showSearch(
                    context: context,
                    delegate: UserSearchDelegate(),
                  ),
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
          child: webService.isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : UserList(users: users)),
    );
  }
}
