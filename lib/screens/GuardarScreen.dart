import 'package:app_12/main.dart';
import 'package:flutter/material.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: formulario());
  }
}

/////////////////////////////////

class formulario extends StatefulWidget {
  const formulario({super.key});

  @override
  State<formulario> createState() => _formularioState();
}

class _formularioState extends State<formulario> {
  
  TextEditingController placa = TextEditingController();
    TextEditingController marca = TextEditingController();
    TextEditingController precio = TextEditingController();


  bool ver = true;
  void cambiarVer(){
    setState(() {
      ver = !ver;
    });
  }




  @override
  Widget build(BuildContext context) {
    

    return Center(
      child: Container(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: placa),

            TextField(controller: marca),

            TextField(
              controller: precio,
              obscureText: ver,
              decoration: InputDecoration(
                prefix: Icon(Icons.price_check),
                suffix: IconButton(
                  onPressed: () => cambiarVer(),
                  icon:ver ? Icon(Icons.remove_red_eye): Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),

            FilledButton(
              onPressed: () => guardar(placa, marca, precio),
              child: Text("Guardar"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/leer"),
              child: Text("Ver datos"),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////

//id, nombre, placa color y marca

// Widget formulario(BuildContext context){

//   TextEditingController placa = TextEditingController();
//   TextEditingController marca = TextEditingController();
//   TextEditingController precio = TextEditingController();

//   return Center(
//     child: Container(
//       width: 350,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(controller: placa),

//           TextField(controller: marca),

//           TextField(controller: precio,
//           obscureText: true,
//           decoration: InputDecoration(
//             prefix: Icon(Icons.password),
//             suffix: IconButton(onPressed: ()=> (), icon: Icon(Icons.remove_red_eye))
//           ),
//           ),

//       FilledButton(onPressed: ()=>guardar(placa, marca, precio), child: Text("Guardar")),
//       ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, "/leer"), child: Text("Ver datos")),

//         ],
//       ),
//     ),
//   );
// }

Future<void> guardar(placa, marca, precio) async {
  await supabase.from('autos').insert({
    'placa': placa.text,
    'marca': marca.text,
    'precio': double.parse(precio.text),
  });
}
