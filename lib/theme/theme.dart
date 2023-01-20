import 'package:flutter/material.dart';

class CustomTheme {
  final customTheme = ThemeData.dark().copyWith(
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: const Color(0XFF16202B),
      colorScheme:
          const ColorScheme.dark().copyWith(secondary: const Color(0XFF48A0EB)),
      textTheme: const TextTheme()
          .copyWith(bodyText1: const TextStyle(color: Colors.white)));
}
