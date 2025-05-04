import 'package:emulando_figma/_core/appcolors.dart';
import 'package:emulando_figma/pages/pages_usuario/estabelecimentos_page.dart';
import 'package:emulando_figma/pages/pages_usuario/home_page.dart';
import 'package:emulando_figma/pages/pages_usuario/p_turisticos_page.dart';
import 'package:emulando_figma/pages/pages_usuario/perfil_page.dart';
import 'package:emulando_figma/pages/pages_usuario/roteiro_page.dart';
import 'package:flutter/material.dart';

BottomAppBar getBottomBar({required BuildContext context}) {
  return BottomAppBar(
    height: MediaQuery.of(context).size.height * 0.13,
    color: AppColors.mainColor,
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: ''),
                  ),
                );
              },
              icon: Icon(Icons.home, color: Colors.white, size: 38),
            ),
            Text("Home", style: TextStyle(fontSize: 11, color: Colors.white)),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EstabelecimentosPage(title: ''),
                  ),
                );
              },
              icon: Icon(
                Icons.local_dining_sharp,
                color: Colors.white,
                size: 38,
              ),
            ),
            Text(
              "Estabelecimentos",
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PontosTuristicosPage(title: ''),
                  ),
                );
              },
              icon: Icon(
                Icons.add_location_rounded,
                color: Colors.white,
                size: 38,
              ),
            ),
            Text(
              "P.Turísticos",
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ],
        ),
        Column(
          spacing: 10,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RoteiroPage()),
                    );
                  },
                  icon: Icon(
                    Icons.edit_road_rounded,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
                Text(
                  "Roteiro",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        Column(
          spacing: 10,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PerfilPage()),
                    );
                  },
                  icon: Icon(Icons.person_pin, color: Colors.white, size: 38),
                ),
                Text(
                  "Perfil",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
