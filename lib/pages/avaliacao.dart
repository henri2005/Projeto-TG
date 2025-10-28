import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class AvaliacaoPage extends StatefulWidget {
  const AvaliacaoPage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<AvaliacaoPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AvaliacaoPage> {
  IconData estrelas = Icons.star_border;
  Color corEstrelas = Colors.grey;
  int avaliacaoApp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context, usuarioLogado: widget.usuario),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            spacing: 30,
            children: [
              Text(
                "DEIXE SUA AVALIAÇÃO SOBRE O APLICATIVO ABAIXO",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return TextButton(
                    onPressed: () {
                      if (estrelas == Icons.star_border) {
                        setState(() {
                          estrelas = Icons.star;
                          corEstrelas = Colors.yellow;
                          avaliacaoApp = [index].single;
                        });
                      } else {
                        setState(() {
                          estrelas = Icons.star_border;
                          corEstrelas = Colors.grey;
                          avaliacaoApp = 0;
                        });
                      }
                    },
                    child: Icon(estrelas, color: corEstrelas, size: 40),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuario,
      ),
    );
  }
}
