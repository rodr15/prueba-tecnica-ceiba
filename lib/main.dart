import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/pages/users_page.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Box box = await Hive.openBox<User>('users');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<WebService>(
        create: (_) => WebService(),
        lazy: false,
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba de Ingreso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersPage(),
    );
  }
}
