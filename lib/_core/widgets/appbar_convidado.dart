import 'package:emulando_figma/_core/appcolors.dart';
import 'package:emulando_figma/pages_usuario/destaques_page.dart';
import 'package:emulando_figma/pages_usuario/estabelecimentos_page.dart';
import 'package:emulando_figma/pages_usuario/mapa_page.dart';
import 'package:emulando_figma/pages_usuario/p_turisticos_page.dart';
import 'package:flutter/material.dart';

Drawer getDrawerConvidado({required BuildContext context}) {
  return Drawer(
    backgroundColor: AppColors.menuColor,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(Icons.map),
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
              Icon(Icons.local_dining_sharp),
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
              Icon(Icons.add_location_rounded),
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
              Icon(Icons.topic),
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
        ],
      ),
    ),
  );
}
