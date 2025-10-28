import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/estabelecimentos_page.dart';
import 'package:turisr/pages/home_page.dart';
import 'package:turisr/pages/p_turisticos_page.dart';
import 'package:turisr/pages/perfil_page.dart';
import 'package:turisr/pages/roteiro_page.dart';
import 'package:flutter/material.dart';

BottomAppBar getBottomBar({
  required BuildContext context,
  UsuarioModel? usuarioLogado,
}) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    height: MediaQuery.of(context).size.height * 0.1,
    color: AppColors.mainColor,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            MyHomePage(title: '', usuarioLogado: usuarioLogado),
                  ),
                );
              },
              icon: Icon(Icons.home, color: Colors.white, size: 30),
            ),
            Text("Home", style: TextStyle(fontSize: 11, color: Colors.white)),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => EstabelecimentosPage(
                          title: '',
                          usuarioLogado: usuarioLogado,
                        ),
                  ),
                );
              },
              icon: Icon(
                Icons.local_dining_sharp,
                color: Colors.white,
                size: 30,
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => PontosTuristicosPage(
                          title: '',
                          usuarioLogado: usuarioLogado,
                        ),
                  ),
                );
              },
              icon: Icon(
                Icons.add_location_rounded,
                color: Colors.white,
                size: 30,
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                RoteiroPage(usuarioLogado: usuarioLogado),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit_road_rounded,
                    color: Colors.white,
                    size: 30,
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => PerfilPage(usuario: usuarioLogado!),
                      ),
                    );
                  },
                  icon: Icon(Icons.person_pin, color: Colors.white, size: 30),
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
