import 'package:flutter/material.dart';
import 'package:mini_projeto/models/data.dart';
import 'package:mini_projeto/screens/dashboard_screen.dart';
import 'package:mini_projeto/screens/list_screen.dart';
import 'package:mini_projeto/screens/main_screen.dart';
import 'package:mini_projeto/screens/registration_screen.dart';
import 'data/database.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final database = Database();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iQueChumbei',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(
        screens: [
          ListScreen(title: 'Listagem de Avaliações', database: database),
          DashboardScreen(title: 'Dashboard'),
          RegistrationScreen(title: 'Registo de Avaliação')
        ],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Lista"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Registo"
          )
        ],
      ),
    );
  }
}