import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prueba_tecnica_ceiba/models/publications.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final User user = arguments['user'] as User;
    final List<Publications> publications =
        arguments['publications'] as List<Publications>;

    List<Item> items = [];
    publications.forEach((element) {
      items.add(Item(element.title, element.body));
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicaciones'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _PersonalInformation(user: user),
            _Publications(publications: publications)
          ],
        ),
      ),
    );
  }
}

class _Publications extends StatefulWidget {
  const _Publications({
    Key? key,
    required this.publications,
  }) : super(key: key);

  final List<Publications> publications;

  @override
  State<_Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<_Publications> {
  List<Item> items = [];
  @override
  void initState() {
    // TODO: implement initState

    for (var element in widget.publications) {
      items.add(Item(element.title, element.body));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: ExpansionPanelList(
        elevation: 4,
        expansionCallback: (panelIndex, isExpanded) {
          items[panelIndex].expanded = !isExpanded;

          setState(() {});
        },
        children: items.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: item.expanded,
              headerBuilder: ((context, isExpanded) {
                return ListTile(
                  title: Text(item.title),
                );
              }),
              body: ListTile(
                subtitle: Text(item.body),
              ));
        }).toList(),
      ),
    ));
  }
}

class Item {
  Item(this.title, this.body);
  final String title;
  final String body;
  bool expanded = false;
}

class _PersonalInformation extends StatelessWidget {
  const _PersonalInformation({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 39,
            child: Text(user.name.substring(0, 3)),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  user.phone,
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
