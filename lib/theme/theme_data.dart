import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background:  Color(0xffF5F9F9),
    primary: Color(0xff37484B),
    secondary: Color(0xff80C58D),
  ),
);
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background:  Color(0xff37484B),
      primary: Color(0xffF9F5F1),
      secondary: Color(0xff518074),
    ),
);
