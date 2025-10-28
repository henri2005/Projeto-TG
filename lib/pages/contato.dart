import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<ContatoPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ContatoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, headerColor: AppColors.mainColor),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuario,
        menuColor: AppColors.menuColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            spacing: 30,
            children: [
              Text(
                "CONTATO",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "Email: henrique.ribeiro22@fatec.sp.gov.br",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuario,
        bottomColor: AppColors.mainColor,
      ),
    );
  }
}
