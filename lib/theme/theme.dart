import 'package:flutter/material.dart';

class CustomTheme {
  final customTheme = ThemeData.light().copyWith(
      primaryColorLight: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme().copyWith(color: Colors.green),
      colorScheme: const ColorScheme.light().copyWith(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            side: const BorderSide(color: Colors.black, width: 1)),
      ),
      iconTheme: const IconThemeData(color: Colors.green, size: 25));
}
