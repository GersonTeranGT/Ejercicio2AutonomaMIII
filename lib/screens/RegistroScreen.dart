import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(width: 300, child: formulario())),
    );
  }
}

Widget formulario() {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController nick = TextEditingController();
  TextEditingController edad = TextEditingController();


  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: correo,
        



        ),
      TextField(
        controller: contrasenia
        ),
      TextField(
        controller: nick,
        ),
      TextField(
        controller: edad,
        ),

      FilledButton.icon(
        onPressed: () => (),
        label: Text("Registro"),
        icon: Image.asset("assets/icons/cuenta.png", width: 30),
      ),
    ],
  );
}
