import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';
import 'package:prueba_tecnica_ceiba/widgets/user_list.dart';

class UserSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear_rounded),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final WebService webService = Provider.of<WebService>(context);
    List<User> users = webService.FilterUsers(query);
    // TODO: implement buildSuggestions
    if (query.isEmpty || users.isEmpty) {
      return _empty;
    }
    return UserList(users: users);
  }

  final Widget _empty = SizedBox(
    child: Center(
      child: Column(
        children: const [
          Icon(
            Icons.people,
            color: Colors.black38,
            size: 200,
          ),
          Text(
            'List is empty',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black38,
            ),
          )
        ],
      ),
    ),
  );
  @override
  Widget buildSuggestions(BuildContext context) {
    final WebService webService = Provider.of<WebService>(context);
    List<User> users = webService.FilterUsers(query);
    // TODO: implement buildSuggestions
    if (query.isEmpty || users.isEmpty) {
      return _empty;
    }

    return UserList(users: users);
  }
}
