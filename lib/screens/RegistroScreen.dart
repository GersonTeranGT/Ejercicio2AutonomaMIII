import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(width: 300, child: formulario(context))),
    );
  }
}

Widget formulario(context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController nick = TextEditingController();
  TextEditingController edad = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(controller: correo),
      TextField(controller: contrasenia),
      TextField(controller: nick),
      TextField(controller: edad),

      FilledButton.icon(
        onPressed: () => registro(context, correo, contrasenia),
        label: Text("Registro"),
        icon: Image.asset("assets/icons/cuenta.png", width: 30),
      ),
    ],
  );
}

Future<void> registro(context, correo, contrasenia) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: correo.text,
          password: contrasenia.text,
        );

    Navigator.pushNamed(context, "/guardar");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("El correo ya existe"),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}
