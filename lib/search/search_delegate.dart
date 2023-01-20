import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';
import 'package:prueba_tecnica_ceiba/widgets/user_card.dart';

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
    // TODO: implement buildResults
    return Text('buildResults');
  }

  final Widget _empty = const SizedBox(
    child: Center(
      child: Icon(
        Icons.people,
        color: Colors.black38,
        size: 200,
      ),
    ),
  );
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return _empty;
    }
    final WebService webService = Provider.of<WebService>(context);
    List<User> users = webService.FilterUsers(query);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: ((context, index) => UserCard(user: users[index])),
    );
  }
}
