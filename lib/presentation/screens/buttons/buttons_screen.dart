import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),

      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          // * .pop() para regresar a la anterior pantalla
              context.pop();
        }
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,//*llegara hasta donde pueda el padre lo hacemos con la intencion de que el crossAligment funcione
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Wrap( //*Wrap es igual a las filas solo que por defecto cuando no se tenga mas espacio bajara a la fila de abajo
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 10, // * Se asegurara de tener un espacio horizontal de los elementos
           
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated button')
            ),
            // * ElevatedButton dissable
            const ElevatedButton(
              onPressed: null, // * Con null deshabilitamos el boton
              child: Text('Elevated Disabled')
            ),
            // * ElevatedButton icon
            ElevatedButton.icon(
              onPressed: () {}, // * Con null deshabilitamos el boton
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevate Button icon'),
            ),
               // * FilledButton normal
            FilledButton(onPressed: () {}, child: const Text('Filled')),
               // * FilledButton icon
            FilledButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.accessibility_new),
              label: const Text('Filled icon'),
            ),
               // * OutlinedButton
            OutlinedButton(
                onPressed: () {}, 
                child: const Text('Outline')
            ),
            // * OutlinedButton icon
            OutlinedButton.icon(
                onPressed: () {}, 
                label: const Text('Outlined icon'),
                icon: const Icon(Icons.terminal),
           ),
             // * TextButton
           TextButton(
             onPressed: () {},
             child: const Text('Text button')
           ),
            // * TextButton icon
           TextButton.icon(
             onPressed: () {},
             icon: const Icon(Icons.turned_in_outlined),
             label: const Text('TextButton icon'),
           ),

           // TODO: Custom button 
           const  CustomButton(),
            // * iconButton
           IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.app_registration_rounded)
           ),
            // * iconButton con estilos
           IconButton(
             onPressed: () {}, 
             icon: const Icon(Icons.app_registration_rounded),
             style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.primary),
              iconColor: const  MaterialStatePropertyAll(Colors.white),

             ),
           ),
    
    
          ],
    
          ), 
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // * Usamos ClipRect para usar el borderRadius
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell( // * InkWell reaccionara como un pequeño efecto cuando se haga clic a un boton
          onTap: () {},
          child: const Padding(
            // * Padding para añadir separacion
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white)),
            
          ),
        ),
      ),
    );
  }
}