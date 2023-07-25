import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  // * Static para que no se creen instancias
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  // * ! Creamos un metodo para simplificar el SnackBar
  void showCustomSnackbar(BuildContext context) {
    // * Con esto cuando se muestre el snackbar y ya se este mostrando un snackbar anterior se ocultara
    ScaffoldMessenger.of(context).clearSnackBars();
    // * Declaramos la variable snackBar
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
          label: 'Ok!',
          onPressed: () {}), // * Mostramos la opcion de aceptar el snackbar
      duration:
          const Duration(seconds: 2), // * Modificamos su tiempo de mostrado
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // * Pasamos el BuilContext porque ahi esta lo basico de la aplicacion como los colores
  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, // * Con esto obligamos al usuario a decidir por una opcion y no pueda salir de dialog
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Text(
                  'Consequat eiusmod est amet sint ex duis minim ipsum eiusmod nisi excepteur esse. Nostrud exercitation do aute est non dolore aliquip aliqua ex nisi deserunt incididunt. Consequat nostrud excepteur dolor adipisicing aliqua ea sunt eu voluptate commodo duis id aute velit. Sunt veniam ex occaecat ex dolor commodo. Sit voluptate sit minim veniam proident veniam ipsum.'),
            
              actions: [
                TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
                FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))
              ],

            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  //* Esto nos mostrara las licencias que se estan usando en la aplicacion
                  showAboutDialog(
                    // * Tambien podemos configurar desde aqui el nombre
                    applicationName: 'Daniel',
                    applicationVersion: 'V 1.1',
                    applicationIcon: Icon(Icons.outbound_sharp),

                    context: context,
                    children: [
                      const Text(
                          'Amet in incididunt commodo elit. Tempor magna sunt enim voluptate irure. Aliqua proident consequat eiusmod ad irure qui mollit dolore sit in esse sint. Est esse culpa et ullamco nostrud reprehenderit commodo eiusmod eiusmod laboris cupidatat irure. Nostrud ea enim culpa proident laboris esse aliquip exercitation culpa nostrud excepteur.'),
                    ],
                  );
                },
                child: const Text('Licencias usadas')),
            FilledButton(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogo')),
          ],
        ),
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
