import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
class HomeScreen extends StatelessWidget {
    // ! Utilizamos static para no crear instancias de la clase _HomeView
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
        centerTitle: false,
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {

  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      // * Builder -> se construira en tiempo de ejecucion
      itemBuilder: (context, index){
          final menuItem = appMenuItems[index];
           return _CustomListTitle(menuItem: menuItem);
           
      }

    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
         leading: Icon(menuItem.icon, color: colors.primary), //Para poner el icono
         // Icono pegado a la parte derecha
         trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary), 
         title: Text(menuItem.title),
         subtitle: Text(menuItem.subTitle),
         // * El onTap permite redireccionara a otras pantallas
         onTap: () {
          // push -> pequeñas tarjetas que se mostraran de uno en uno
          // replace -> quitara la ruta anterior y no se podra regresar
          /* 
          ! 1 - esta es una forma de crear rutas
            Navigator.of(context).push(
              MaterialPageRoute(  
                builder: (context) => const CardsScreen()
                )
            );
           */
         
         // ! 2 - Esta es la segunda forma donde convocamos a la ruta creada en el main
       //   Navigator.pushNamed(context, menuItem.link);
         
         // ! 3 - esta es otra forma de crear rutas que es la mas recomendada
           context.push(menuItem.link);
        // * En caso de que no queramos usar la forma anterior: 
           // context.pushNamed(CardsScreen.name);
         },
     );
  }
}