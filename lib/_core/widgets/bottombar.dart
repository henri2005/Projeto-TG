import 'package:flutter/foundation.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/estabelecimentos_page.dart';
import 'package:turisr/pages/home_page.dart';
import 'package:turisr/pages/p_turisticos_page.dart';
import 'package:turisr/pages/perfil_page.dart';
import 'package:turisr/pages/roteiro_page.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;

void _onItemPressed(int index) {
  _selectedIndex = index;
}

BottomAppBar getBottomBar({
  required BuildContext context,
  UsuarioModel? usuarioLogado,
  Color? bottomColor,
}) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    height: MediaQuery.of(context).size.height * 0.1,
    color: bottomColor,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                _onItemPressed(0);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            MyHomePage(title: '', usuarioLogado: usuarioLogado),
                  ),
                );
              },
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            Text(
              "Home",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                _onItemPressed(1);
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
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            Text(
              "Estabelecimentos",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                _onItemPressed(2);
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
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            Text(
              "P.Turísticos",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
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
                    _onItemPressed(3);
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
                    color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                    size: 30,
                  ),
                ),
                Text(
                  "Roteiro",
                  style: TextStyle(
                    fontSize: 11,
                    color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                  ),
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
                    _onItemPressed(4);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => PerfilPage(usuario: usuarioLogado!),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.person_pin,
                    color: _selectedIndex == 4 ? Colors.white : Colors.grey,
                    size: 30,
                  ),
                ),
                Text(
                  "Perfil",
                  style: TextStyle(
                    fontSize: 11,
                    color: _selectedIndex == 4 ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
