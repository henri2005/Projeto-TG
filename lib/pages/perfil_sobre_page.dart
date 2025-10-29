import 'package:get_storage/get_storage.dart';
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

class PerfilSobrePage extends StatefulWidget {
  const PerfilSobrePage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<PerfilSobrePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PerfilSobrePage> {
  final box = GetStorage();
  late String temaEscuro = "isDark";
  late bool isdark = false;

  @override
  void initState() {
    super.initState();
    isdark = box.read(temaEscuro) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        headerColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
      ),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuario,
        menuColor: isdark ? DarkColors.menuColor : AppColors.menuColor,
      ),
      backgroundColor:
          isdark ? DarkColors.backgroundColor : AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color:
                    isdark
                        ? DarkColors.backgroundColor
                        : AppColors.backgroundColor,
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
                      color: isdark ? Colors.white : Colors.black,
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
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: isdark ? Colors.white : Colors.black,
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
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: isdark ? Colors.white : Colors.black,
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
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: isdark ? Colors.white : Colors.black,
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
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 40,
                        color: isdark ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuario,
        bottomColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
      ),
    );
  }
}
