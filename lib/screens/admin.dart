import 'package:flutter/material.dart';
import 'package:frontend/screens/createHueca.dart';
import 'package:frontend/screens/createUser.dart';
import 'package:frontend/screens/updateHueca.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => Admin();
}

/// This is the private State class that goes with MyStatefulWidget.
class Admin extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    CreateHueca(),
    UpdateHueca(),
    CreateUser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administrador'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Crear Hueca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Actualizar Hueca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Crear User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(94, 114, 228, 1.0),
        onTap: _onItemTapped,
      ),
    );
  }
}