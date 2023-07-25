import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // * Para usar el go_router usamos el .router en MaterialApp
    return MaterialApp.router(
      title: 'Flutter Widgets', //*Titulo de la aplicacion que se muestra en los dialogos
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor:3).getTheme(),
      // ! 2 - routes es una forma de crear rutas hacia otras pantallas
      /*
      routes: {
          '/buttons': (context) => const ButtonsScreen(),
          '/cards': (context) => const CardsScreen(),
      },
      */

      // ! La 3era forma de crear rutas es creando un archivo en router en el cual usamos el paquete go_router
      routerConfig: appRouter,
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