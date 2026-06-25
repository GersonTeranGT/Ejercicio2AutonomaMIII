import 'package:app_12/screens/DetallesScreen.dart';
import 'package:app_12/screens/GuardarScreen.dart';
import 'package:app_12/screens/LeerScreen.dart';
import 'package:app_12/screens/LoginScreen.dart';
import 'package:app_12/screens/RegistroScreen.dart';
import 'package:app_12/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


//SUPABASE
final supabase = Supabase.instance.client;
Future<void> main() async {


  await Supabase.initialize(
    url: 'https://iqitrzboycbasqnszwdi.supabase.co',
    publishableKey: 'sb_publishable_c4D2QyXFBGcJvspUWWXV8A_SofGZgqG',
  );

  runApp(const AppFire());
}

class AppFire extends StatefulWidget {
  const AppFire({super.key});

  @override
  State<AppFire> createState() => _AppFireState();
}

class _AppFireState extends State<AppFire> {

  bool modoOscuro = true;

  void cambiarTema(){
    setState(() {
      modoOscuro = !modoOscuro;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: modoOscuro ? ThemeData.dark(): ThemeData.light(),
      initialRoute: "/guardar",
      routes: {
        "/": (context) => WelcomeScreen(cambiarTema),
        "/login": (context) => LoginScreen(),
        "/registro": (context) => RegistroScreen(),
        "/guardar": (context) => Guardarscreen(),
        "/leer": (context) => LeerScreen(),
        "/detalles": (context) => DetallesScreen(),
      },
    );
  }
}
