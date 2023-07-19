import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor:3).getTheme(),
      home: const HomeScreen(),
      // ! 2 - routes es una forma de crear rutas hacia otras pantallas
      routes: {
          '/buttons': (context) => const ButtonsScreen(),
          '/cards': (context) => const CardsScreen(),
      },
    );
  }
}


class TextCustom extends StatelessWidget {
  
  final String text;
  const TextCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(color: Colors.blue),);
  }
}