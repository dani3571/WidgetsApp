import 'package:flutter/material.dart';

class SnackbarScreen  extends StatelessWidget {
  // * Static para que no se creen instancias
  static const String name = 'snackbar_screen';

    const SnackbarScreen ({super.key});
   
   // * ! Creamos un metodo para simplificar el SnackBar
  void showCustomSnackbar( BuildContext context){
    
     // * Con esto cuando se muestre el snackbar y ya se este mostrando un snackbar anterior se ocultara
    ScaffoldMessenger.of(context).clearSnackBars();
    // * Declaramos la variable snackBar
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}), // * Mostramos la opcion de aceptar el snackbar
      duration: const Duration( seconds: 2), // * Modificamos su tiempo de mostrado
    );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      // * El button del scafold automaticamente se posiciona abajo a la derecha
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}