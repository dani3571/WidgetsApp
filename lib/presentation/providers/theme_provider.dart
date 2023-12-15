import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

final isDarkModeProvider = StateProvider<bool>((ref) => false);


final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

// Objeto de tipo AppTheme (custom)
// El StateNotifierProvider es parecido al StateProvider pero se usa en casos mas elaborados
final themeNotifierProvider = StateNotifierProvider<ThemeNotifierController, AppTheme >((ref) => ThemeNotifierController());


class ThemeNotifierController extends StateNotifier<AppTheme>{
  // Creamos la primera instancia del AppTheme
  // Estado = Nueva instancia del AppTheme
  ThemeNotifierController(): super(AppTheme());
  // ! Con el state podemos acceder a las propiedades del AppThme
/*
  void algo(){
    state.
  }
*/

  void toggleDarkMode(){
   // * El nuevo estado sera igual a la copia del actual estado enviando el isDarkMode como valor opuesto al valor que tengamos ahi actualmente
   state = state.copyWith(isDarkMode: !state.isDarkMode);
    }

  void changeColorIndex(int index){
    state = state.copyWith(selectedColor: index);
  }
}