import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    // integrando riverpood
     const ProviderScope(
      child: MainApp(),
    ),
);
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final isDarkMode = ref.watch(isDarkModeProvider);
    // final selectedThemeColor = ref.watch(selectedIndexColorProvider);
      final AppTheme appTheme = ref.watch(themeNotifierProvider);
    // * Para usar el go_router usamos el .router en MaterialApp
    return MaterialApp.router(
      title: 'Flutter Widgets', //*Titulo de la aplicacion que se muestra en los dialogos
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor:appTheme.selectedColor, isDarkMode: appTheme.isDarkMode).getTheme(),
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