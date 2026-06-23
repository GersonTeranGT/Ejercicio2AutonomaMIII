import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
