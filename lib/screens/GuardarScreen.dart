import 'package:flutter/material.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: formulario(),

    );
  }
}

//id, nombre, placa color y marca

Widget formulario(){

  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();


  return 
  Center(
    child: Container(
      width: 350,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      TextField(controller: placa,),
      TextField(controller:  marca,),
      TextField(controller: precio,),

      FilledButton(onPressed: ()=>(), child: Text("Guardar")),

    ],),),
  );
}