import 'package:emulando_figma/pages/home_page.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key, required this.title});

  final String title;

  @override
  State<FavoritosPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 130,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset('assets/imagens/logo.jpg', height: 80.0),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: PopupMenuButton(
                  itemBuilder: (context) {
                    return <PopupMenuItem<String>>[
                      PopupMenuItem(child: Text("Mapa")),
                      PopupMenuItem(child: Text('Estabelecimentos')),
                    ];
                  },
                ),
              );
            },
            icon: Icon(Icons.menu_rounded, color: Colors.white, size: 60),
          ),
        ],
        iconTheme: IconThemeData(size: 60, opacity: 0.9),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 196, 196, 196),
                      offset: Offset(0, 6),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Image.asset(
                        'assets/imagens/carnaval.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                      Text(
                        "Estação Ferroviária de São Roque",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("Endereço tal, rua tal"),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38, width: 6),
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.27,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 196, 196, 196),
                      offset: Offset(0, 6),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Image.asset('assets/imagens/portal.png'),
                      Text(
                        "Vinícola XV De Novembro",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("Endereço tal, rua tal"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.12,
        color: Colors.purple,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              children: [
                Icon(Icons.home, color: Colors.white, size: 38),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(title: ''),
                      ),
                    );
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              spacing: 10,
              children: [
                Icon(Icons.local_dining_sharp, color: Colors.white, size: 38),
                Text(
                  "Restaurantes",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
            Column(
              spacing: 10,
              children: [
                Icon(Icons.add_location_rounded, color: Colors.white, size: 38),
                Text(
                  "P.Turísticos",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
            Column(
              spacing: 10,
              children: [
                Icon(Icons.edit_road_rounded, color: Colors.white, size: 38),
                Text(
                  "Roteiro",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
            Column(
              spacing: 10,
              children: [
                Icon(Icons.person_pin, color: Colors.white, size: 38),
                Text(
                  "Perfil",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
