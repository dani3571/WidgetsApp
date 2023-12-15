import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

int contador = 1;

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
            IconButton(onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            }, 
            icon: Icon(isDarkMode ? Icons.light_mode_outlined :Icons.dark_mode_outlined ))
          ],

        ),
        body: Center(
          child: Text(
          'Valor: $value',
          style: const TextStyle(fontSize: 40),
          )
        ),
    
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          // el state es el valor del provider
          onPressed: () => ref.read(counterProvider.notifier).state++
        ));
  }
}


