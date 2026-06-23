import 'package:app_12/screens/DetallesScreen.dart';
import 'package:app_12/screens/GuardarScreen.dart';
import 'package:app_12/screens/LeerScreen.dart';
import 'package:app_12/screens/LoginScreen.dart';
import 'package:app_12/screens/RegistroScreen.dart';
import 'package:app_12/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppFire());
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: "/guardar",
      routes: {
        "/":(context)=> WelcomeScreen(),
        "/login": (context)=> LoginScreen(),
        "/registro": (context)=> RegistroScreen(),
        "/guardar":(context)=> Guardarscreen(),
        "/leer":(context)=> LeerScreen(),
        "/detalles":(context)=> DetallesScreen(),
      },
    );
  }
}
