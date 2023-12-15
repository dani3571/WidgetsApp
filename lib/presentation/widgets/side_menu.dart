import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';



class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex= 0;

  @override
  Widget build(BuildContext context) {
    // ! Verficamos si el dispositivo tiene notch 
    // * Notch es un espacio que no se peude ocupar en el desarrollo como la barra superior de los iphone
    // * Si el padding top es mayor a 35 es que se tiene un notch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
   

    return NavigationDrawer(
      // * El selectedIndex nos hara todo el trabajo de seleccion en los elementos del NavigationDrawer
          selectedIndex: navDrawerIndex,
        // * Para marcar la opcion del drawer
          onDestinationSelected: (value) { 
            
            setState(() {
              navDrawerIndex = value;
            });          
            
            final menuItem = appMenuItems[value];

            context.push(menuItem.link);
            widget.scaffoldKey.currentState?.closeDrawer();
          },
      children: [
          Padding(
            // * Si tiene notch el padding top sera de 0 caso contrario de 20
            padding: EdgeInsets.fromLTRB(28,hasNotch ? 0: 20,16,10),
            child: const Text('Main'),
          ),
         ...appMenuItems
         .sublist(0,3) // * Esto para solo tener los primeros 3 elementos del listado
         .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          )),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(), // * Divider es un Widget que crea una linea
            
          ),
          const Padding(
            // * Si tiene notch el padding top sera de 0 caso contrario de 20
            padding: EdgeInsets.fromLTRB(28,10,16,10),
            child: Text('Mas opciones'),
          ),
          ...appMenuItems
         .sublist(3) // * Mostramos los elementos del 3 para adelante
         .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          )),

      ]
    );
  }
}