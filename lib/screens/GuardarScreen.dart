import 'package:app_12/main.dart';
import 'package:flutter/material.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: formulario(context),

    );
  }
}

//id, nombre, placa color y marca

Widget formulario(BuildContext context){

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

      FilledButton(onPressed: ()=>guardar(placa, marca, precio), child: Text("Guardar")),
      ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, "/leer"), child: Text("Ver datos")),

    ],),),
  );
}

Future<void> guardar (placa, marca, precio) async {
  await supabase
    .from('autos')
    .insert(
      {
      'placa': placa.text, 
      'marca': marca.text,
      'precio': double.parse(precio.text)
      }
      );
}
