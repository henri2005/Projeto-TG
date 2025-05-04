import 'package:emulando_figma/_core/appcolors.dart';
import 'package:emulando_figma/pages/pages_usuario/destaques_page.dart';
import 'package:emulando_figma/pages/pages_usuario/estabelecimentos_page.dart';
import 'package:emulando_figma/pages/pages_usuario/favoritos_page.dart';
import 'package:emulando_figma/pages/pages_usuario/mapa_page.dart';
import 'package:emulando_figma/pages/pages_usuario/p_turisticos_page.dart';
import 'package:emulando_figma/pages/pages_usuario/perfil_page.dart';
import 'package:emulando_figma/pages/pages_usuario/roteiro_page.dart';
import 'package:flutter/material.dart';

AppBar getAppBar({required BuildContext context, String? title}) {
  return AppBar(
    backgroundColor: AppColors.mainColor,
    toolbarHeight: MediaQuery.of(context).size.height * 0.12,
    leadingWidth: MediaQuery.of(context).size.width,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset('assets/imagens/logo_turisr.png', height: 80.0),
        ),
      ],
    ),
    iconTheme: IconThemeData(size: 60, opacity: 0.9),
  );
}

Drawer getDrawer({required BuildContext context}) {
  return Drawer(
    backgroundColor: AppColors.menuColor,
    child: Container(
      margin: EdgeInsets.only(top: 90),
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        spacing: 58,
        children: [
          Row(
            children: [
              Icon(Icons.map, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapaPage(title: ''),
                    ),
                  );
                },
                child: Text("Mapa", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.local_dining_sharp, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EstabelecimentosPage(title: ''),
                    ),
                  );
                },
                child: Text("Estabelecimentos", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.add_location_rounded, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PontosTuristicosPage(title: ''),
                    ),
                  );
                },
                child: Text(
                  "Pontos Turísticos",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.edit_road, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RoteiroPage()),
                  );
                },
                child: Text(
                  "Roteiro de Viagem",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.topic, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DestaquesPage(title: ''),
                    ),
                  );
                },
                child: Text("Destaques", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.favorite, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritosPage(title: ''),
                    ),
                  );
                },
                child: Text("Favoritos", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.person_pin, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PerfilPage()),
                  );
                },
                child: Text(
                  "Perfil do Usuário",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
