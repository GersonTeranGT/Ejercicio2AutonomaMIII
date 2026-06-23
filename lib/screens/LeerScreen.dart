import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LeerScreen extends StatelessWidget {
  const LeerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: lista(),
    );
  }
}

Future<List<dynamic>> leer() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('autos/').get();

  if (snapshot.exists) {

  return snapshot.children.map((child){
    final data = Map.from(child.value as Map);
    return{
      "placa": child.key,
      "marca": data['marca'],
      "precio": data['precio']
    };
  }).toList();

  } else {
    return [];
  }
}

Widget lista (){
  return FutureBuilder(future: leer(), builder: (context, snapshot) {
    if(snapshot.hasData){
      final data = snapshot.data!;

      return ListView.builder(itemCount: data.length,  itemBuilder: (context, index) {
        final item = data[index];

        return Card(
              child: ListTile(
                title: Text(item['placa']),
                subtitle: Text(item['marca']),
                onTap: () => verMas(context, item),
              ),
            );

      },);
    }else{
      return Text("No hay datos");
    }
  },);
}

void verMas(BuildContext context, item) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(item['marca']),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Placa: ${item['placa']}"),
          Text("Precio: ${item['precio']}")
        ],
      ),
    ),
  );
}