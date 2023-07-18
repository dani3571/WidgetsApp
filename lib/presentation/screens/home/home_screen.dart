import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
class HomeScreen extends StatelessWidget {
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
         // * El onTap para que redireccione a otras pantallas
         onTap: () {
           // TODO: navegar a otras pantallas
         },
     );
  }
}