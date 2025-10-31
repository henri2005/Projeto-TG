import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/cidade_page.dart';
import 'package:turisr/pages/convidado/cidade_page.dart';
import 'package:turisr/pages/convidado/destaques_page.dart';
import 'package:turisr/pages/convidado/estabelecimentos_page.dart';
import 'package:turisr/pages/convidado/mapa_page.dart';
import 'package:turisr/pages/convidado/p_turisticos_page.dart';
import 'package:turisr/pages/destaques_page.dart';
import 'package:turisr/pages/estabelecimentos_page.dart';
import 'package:turisr/pages/favoritos_page.dart';
import 'package:turisr/pages/mapa_page.dart';
import 'package:turisr/pages/p_turisticos_page.dart';
import 'package:turisr/pages/perfil_page.dart';
import 'package:turisr/pages/roteiro_page.dart';
import 'package:flutter/material.dart';

AppBar getAppBar({
  required BuildContext context,
  String? title,
  Color? headerColor,
}) {
  return AppBar(
    backgroundColor: headerColor,
    toolbarHeight: MediaQuery.of(context).size.height * 0.12,
    leadingWidth: MediaQuery.of(context).size.width,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Image.asset('assets/imagens/logo_turisr.png', height: 80.0),
    ),
    iconTheme: IconThemeData(size: 60, opacity: 0.9, color: Colors.white),
  );
}

Drawer getDrawer({
  required BuildContext context,
  UsuarioModel? usuarioLogado,
  Color? menuColor,
}) {
  return Drawer(
    backgroundColor: menuColor,
    child: Container(
      margin: EdgeInsets.only(top: 90),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        spacing: 45,
        children: [
          Row(
            children: [
              Icon(Icons.location_city, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CidadePage()),
                  );
                },
                child: Text(
                  "A Cidade",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.map, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => MapaPage(usuarioLogado: usuarioLogado),
                    ),
                  );
                },
                child: Text(
                  "Mapa",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.local_dining_sharp, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => EstabelecimentosPage(
                            title: '',
                            usuarioLogado: usuarioLogado,
                          ),
                    ),
                  );
                },
                child: Text(
                  "Estabelecimentos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.add_location_rounded, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PontosTuristicosPage(
                            title: '',
                            usuarioLogado: usuarioLogado,
                          ),
                    ),
                  );
                },
                child: Text(
                  "Pontos Turísticos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.edit_road, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              RoteiroPage(usuarioLogado: usuarioLogado),
                    ),
                  );
                },
                child: Text(
                  "Roteiro de Viagem",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.topic, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DestaquesPage(
                            title: '',
                            usuarioLogado: usuarioLogado,
                          ),
                    ),
                  );
                },
                child: Text(
                  "Destaques",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.favorite, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              FavoritosPage(usuarioLogado: usuarioLogado),
                    ),
                  );
                },
                child: Text(
                  "Favoritos",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.person_pin, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PerfilPage(usuario: usuarioLogado!),
                    ),
                  );
                },
                child: Text(
                  "Perfil do Usuário",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Drawer getDrawerConvidado({required BuildContext context}) {
  return Drawer(
    backgroundColor: AppColors.menuColor,
    child: Container(
      margin: EdgeInsets.only(top: 90),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        spacing: 45,
        children: [
          Row(
            children: [
              Icon(Icons.location_city, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CidadeConvidado()),
                  );
                },
                child: Text(
                  "A Cidade",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.map, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapaConvidado()),
                  );
                },
                child: Text(
                  "Mapa",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.local_dining_sharp, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EstabelecimentoConvidado(title: ''),
                    ),
                  );
                },
                child: Text(
                  "Estabelecimentos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.add_location_rounded, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PontosTuristicosConvidado(title: ''),
                    ),
                  );
                },
                child: Text(
                  "Pontos Turísticos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.topic, size: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DestaquesConvidado(title: ''),
                    ),
                  );
                },
                child: Text(
                  "Destaques",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
