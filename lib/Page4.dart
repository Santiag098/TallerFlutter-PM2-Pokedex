import 'package:flutter/material.dart';
import 'package:pokedex/homePage.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bulbasaur"),
        centerTitle: true,
        backgroundColor:  const Color.fromARGB(255, 102, 18, 12),
        leading: const Icon(Icons.menu),
        actions: const <Widget>[
          Icon(Icons.search),
          Icon(Icons.more_vert)
        ],
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'lib/assets/bulbasaurfondo.png', 
            fit: BoxFit.cover, 
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'POKEMÓN SEMILLA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                const SizedBox(height: 8), 
                const Text(
                  'A Bulbasaur es fácil verle echándose una siesta al sol. La semilla que tiene en el lomo va creciendo cada vez mas a medida que absorbe los rayos del sol.\n\nAtaque Rápido: Látigo Cepa.\n\nAtaque Cargado: Bomba Germen.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(Icons.home),
                  color: const Color.fromARGB(255, 102, 18, 12),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false,
                );
              },
            ),
              ],
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor:  const Color.fromARGB(255, 102, 18, 12),
        onPressed: () {
          _mostrarAlerta(context);
      },
      child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}

void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Creditos'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Desarrollado por:'),
              SizedBox(height: 10), 
              Text('Santiago Bautista\nEivar Mora'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CERRAR'),
            ),
          ],
        );
      },
    );
  }
