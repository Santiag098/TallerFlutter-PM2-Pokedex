import 'package:flutter/material.dart';
import 'package:pokedex/Page2.dart';
import 'package:pokedex/Page3.dart';
import 'package:pokedex/Page4.dart';
import 'package:pokedex/Page5.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        centerTitle: true,
        backgroundColor:  const Color.fromARGB(255, 102, 18, 12),
        leading: const Icon(Icons.menu),
        actions: const <Widget>[
          Icon(Icons.search),
          Icon(Icons.more_vert)
        ],
      ),
      body: MyListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  const Color.fromARGB(255, 102, 18, 12),
        onPressed: () {
          _mostrarAlerta(context);
      },
      child: const Icon(Icons.add),
      ),
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


class MyListView extends StatelessWidget {
  MyListView({super.key});
  final List<Map<String, dynamic>> dataList = [
    {"avatar": "", "content": "Pikachu", "otherText": "Pokemon tipo electrico", "avatarImage": "lib/assets/pikachu.webp",},
    {"avatar": "", "content": "Charmander", "otherText": "Pokemon tipo fuego", "avatarImage": "lib/assets/charmander.png",},
    {"avatar": "", "content": "Bulbasaur", "otherText": "Pokemon tipo planta", "avatarImage": "lib/assets/bulbasaur.png",},
    {"avatar": "", "content": "Squirtle", "otherText": "Pokemon tipo agua", "avatarImage": "lib/assets/squirtle.png",},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder:(context, index) {
        return  ListTile(
          leading: CircleAvatar(
            backgroundImage: dataList[index]["avatarImage"] != null
            ? AssetImage(dataList[index]["avatarImage"])
            : const AssetImage(''),
          ),
          title: Text(dataList[index]["content"]),
          subtitle: Text(dataList[index]["otherText"]),
          onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdPage()));
                  break;
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FourthPage()));
                  break;
                case 3:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FifthPage()));
                  break;
          }
          }
        );
        
      },
    );
  }
}