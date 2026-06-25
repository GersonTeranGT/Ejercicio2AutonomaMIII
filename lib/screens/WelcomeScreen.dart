import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final cambiarTema;
  const WelcomeScreen(this.cambiarTema ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()=> cambiarTema(), 
            icon: Icon(Icons.swap_horizontal_circle_rounded))],),




      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.pinimg.com/736x/cf/83/7a/cf837ad98b1ae445b6d7ca828b5afc7c.jpg"),
        fit: BoxFit.cover
        )),
        child: Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: ()=>Navigator.pushNamed(context, "/login"), 
            child: Text("Login")),
            FilledButton(
              onPressed: ()=> Navigator.pushNamed(context, "/registro"), 
            child: Text("Registro"))
          ],
        )),
      ),
    );
  }
}
