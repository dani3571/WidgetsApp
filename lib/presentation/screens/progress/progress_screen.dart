import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  // * Static para que no se creen instancias
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),

      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30), //* Separacion de arriba
          Text('Circular progress indicator'),
          SizedBox(height: 10), // * Separacion entre el texto y progress 
          CircularProgressIndicator(strokeWidth: 3, backgroundColor: Colors.black45),
          SizedBox(height: 20), 
          Text('Progress circular y linear controlado'),
          SizedBox(height: 10), // * Separacion entre el texto y progress 
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    //* El stream builder se construira al mismo tiempo de la construccion de la aplicacion
    return StreamBuilder(
      // ! Un stream periodic que estara emitiendo valores 
       // * esto retornara 0.0, 1.0, 2.0.. hasta que el value no pase del 100 (con takeWhile), si pasa del 100 el Stream dejara de funcionar
      stream: Stream.periodic(const Duration(milliseconds: 500), (value) => (value*2)/100).takeWhile((value) => value<100),
      
      builder: (context, snapshot) {
        final double progressValue = snapshot.data ?? 0; // * Recuperamos el value con el data si no tiene valor sera igual a 0 
        return Padding( // * Padding para que tenga un espacio horizontal de 20
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12,),
            const SizedBox(width: 20),
            // ! El linearProgress necesita que definamos un espacio es por ello que usamos el widget Expanded
            Expanded(
              child: LinearProgressIndicator(value: progressValue)
            )
            
          ],
        ),
      );
      },
    );
  }
}