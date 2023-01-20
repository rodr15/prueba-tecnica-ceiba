import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_ceiba/models/publications.dart';
import 'package:prueba_tecnica_ceiba/models/user.dart';
import 'package:prueba_tecnica_ceiba/pages/user_details.dart';
import 'package:prueba_tecnica_ceiba/pages/users_page.dart';
import 'package:prueba_tecnica_ceiba/provider/web_service.dart';
import 'package:prueba_tecnica_ceiba/theme/theme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(GeoAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(PublicationsAdapter());

  Box boxUsers = await Hive.openBox<User>('users');
  Box boxPublications = await Hive.openBox<Publications>('publications');
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
      theme: CustomTheme().customTheme,
      initialRoute: 'Home',
      routes: {
        'Home': (_) => const UsersPage(),
        'Details': (_) => const UserDetails(),
      },
    );
  }
}
