import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class DestaquesPage extends StatefulWidget {
  const DestaquesPage({super.key, required this.title, this.usuarioLogado});

  final String title;
  final UsuarioModel? usuarioLogado;

  @override
  State<DestaquesPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DestaquesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, headerColor: AppColors.mainColor),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuarioLogado,
        menuColor: AppColors.menuColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              "Carnaval São Roque 2025",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.ubuntu().fontFamily,
              ),
            ),
            Image.asset('assets/imagens/carnaval.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    "A Folia vai começar! Dos dias 28 de Fevereiro a 03 de Março, venha prestigiar o animado Carnaval da nossa cidade! Com muita festa e animação, em meio ao desfile das principais escolas de samba de São Roque!",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  ),
                  Text(
                    "O evento tem apoio da Prefeitura Municipal e está certo para ser um dos maiores eventos do ano.",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        bottomColor: AppColors.mainColor,
      ),
    );
  }
}
