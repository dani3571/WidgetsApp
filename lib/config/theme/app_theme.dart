import 'package:flutter/material.dart';

// * Lista de colores
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme{
  
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({this.selectedColor = 0 , this.isDarkMode=false})
  : assert(selectedColor >= 0, 'Select color must be greater then 0'),
    assert(selectedColor < colorList.length, 'Selected color must be less or equal than ${colorList.length - 1}');



  ThemeData getTheme() =>ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    // * Podemos personalizar el appTheme desde aqui
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
  );

  // retorna una instancia de AppTheme se utiliza para que las variables de AppTheme sean inmutables
  AppTheme copyWith({
   int? selectedColor,
   bool? isDarkMode
  }) => AppTheme(
     selectedColor: selectedColor ?? this.selectedColor,
     isDarkMode: isDarkMode ?? this.isDarkMode
  );


}