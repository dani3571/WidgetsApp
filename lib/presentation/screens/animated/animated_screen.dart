import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  // * Static para que no se creen instancias
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;
  void changeShape(){
    final random = Random();

    width = random.nextInt(300)+ 120; // * El valor inicial sera 50
    height= random.nextInt(300)+ 120; // * El valor inicial - minimo sera 50
    borderRadius = random.nextInt(100) + 20.0;
    
    color = Color.fromARGB(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
       1);
    setState((){});
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          // * Para ver el efecto del AnimatedContainer podemos cambiar los valores de tamaño, color o borde
            duration: const Duration(seconds: 2),
            curve: Curves.elasticOut, // * Tipo de animacion
            width: width <= 0 ? 0 : width, // * Condicional por si el random es menor a 0
            height: height <= 0 ? 0: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius < 0 ? 0: borderRadius),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}