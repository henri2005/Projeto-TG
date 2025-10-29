import 'package:get_storage/get_storage.dart';
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
                  color: isdark ? Colors.white : Colors.black,
                ),
              ),

              Text(
                "Email: henrique.ribeiro22@fatec.sp.gov.br",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                  color: isdark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
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
