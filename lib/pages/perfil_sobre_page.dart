import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/avaliacao.dart';
import 'package:turisr/pages/contato.dart';
import 'package:turisr/pages/politicas.dart';
import 'package:turisr/pages/termos.dart';

class PerfilSobrePage extends StatelessWidget {
  const PerfilSobrePage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, headerColor: AppColors.menuColor),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: this.usuario,
        menuColor: AppColors.menuColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Sobre",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  ),
                ],
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermosPage()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Termos de Uso",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoliticasPage()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Políticas de Privacidade",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContatoPage()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contato",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AvaliacaoPage()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nos avalie!",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
