import 'package:flutter/material.dart';
import 'package:language_change/pages/home.dart';
import 'package:language_change/theme/theme_data.dart';
import 'package:provider/provider.dart';

import 'theme/theme_mode_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeModeProvider()..setThemeMode(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkMode,
      theme: lightMode,
      themeMode:
          Provider.of<ThemeModeProvider>(context).themeValue == Mode.system
              ? ThemeMode.system
              : Provider.of<ThemeModeProvider>(context).themeValue == Mode.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
