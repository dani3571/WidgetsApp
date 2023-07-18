// La idea de este archivo es añadir cada una de las opciones del menu

import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle, 
    required this.link,
    required this.icon
  });

}

const appMenuItems = <MenuItem>[
    MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en el flutter', 
      link: '/buttos',
      icon: Icons.smart_button_outlined
    ),
     MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado', 
      link: '/card',
      icon: Icons.credit_card
    ),
    
];


