import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 22.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text(
                              "Pesquisar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Encontre os melhores destaques de São Roque",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.37,
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 104, 104, 104),
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Text(
                          "Evento em Destaque",
                          style: TextStyle(fontSize: 25),
                        ),
                        Image.asset(
                          'imagens/carnaval.png',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.search,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.37,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Text("Conheça São Roque", style: TextStyle(fontSize: 25)),
                      Image.asset(
                        'assets/portal.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.search,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
