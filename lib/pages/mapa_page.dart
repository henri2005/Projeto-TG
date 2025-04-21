import 'package:emulando_figma/pages/home_page.dart';
import 'package:flutter/material.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key, required this.title});

  final String title;

  @override
  State<MapaPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MapaPage> {
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
              Image.asset(
                'assets/imagens/portal.png',
                width: MediaQuery.of(context).size.width,
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.44,
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
                      Text(
                        "Restaurante Pica-Fumo",
                        style: TextStyle(fontSize: 20),
                      ),
                      Image.asset(
                        'assets/imagens/carnaval.png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              "Um dos mais bem-avaliados restaurantes do Roteiro do Vinho, elogiado por seu cardápio variado.",
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.cyan[700],
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(
                                    68,
                                    153,
                                    152,
                                    152,
                                  ),
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Text(
                              "VEJA MAIS",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text("Avaliação", style: TextStyle(fontSize: 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.grey, size: 50),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.44,
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
                      Text("Vinícola Goes", style: TextStyle(fontSize: 20)),
                      Image.asset(
                        'assets/imagens/carnaval.png',
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text(
                              "Uma das maiores e mais antigas vinícolas de São Roque, com várias atrações e serviços oferecidos.",
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.cyan[700],
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(
                                    68,
                                    153,
                                    152,
                                    152,
                                  ),
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Text(
                              "VEJA MAIS",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text("Avaliação", style: TextStyle(fontSize: 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                              Icon(Icons.star, color: Colors.yellow, size: 50),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.145,
        color: Colors.purple,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
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
