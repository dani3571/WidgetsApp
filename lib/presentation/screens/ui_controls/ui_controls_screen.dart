import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  // * Static para que no se creen instancias
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

// * emun para controlar el radioButton
enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  
  bool isDeveloper = true;
  
  Transportation selectedTransportation = Transportation.car; // * .car para que sea su valor por defecto
  
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  // ! Cuando se de clic que el valor del bool sea lo contrario de lo que esta actualmente
                  isDeveloper = !isDeveloper;
                })),
        // ! ExpansionTitle es un widget muy interesante el cual permite crear como un selected box y guardar elementos dentro de ello
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text(selectedTransportation.toString()),
          children: [
            //* RadioButton
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        // ! CheckListTitle

        CheckboxListTile(
          title: const Text('¿Incluir desayuno?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            //* Asignamos el valor opuesto del wantsBreakfast
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
         CheckboxListTile(
          title: const Text('¿Incluir Almuerzo?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            //* Asignamos el valor opuesto del wantsBreakfast
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Incluir Cena?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            //* Asignamos el valor opuesto del wantsBreakfast
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
