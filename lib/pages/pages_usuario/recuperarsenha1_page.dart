import 'package:turisr/_core/widgets/botoescomicone.dart';
import 'package:turisr/_core/widgets/input.dart';
import 'package:turisr/pages/pages_usuario/recuperarsenha2_page.dart';
import 'package:flutter/material.dart';

class RecuperarPage extends StatefulWidget {
  const RecuperarPage({super.key, required this.title});

  final String title;

  @override
  State<RecuperarPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecuperarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Input(visibilidade: false, label: 'Qual é o seu email?'),

                BotaoIcone(
                  largura: 1,
                  altura: 0.07,
                  texto: 'Continuar',
                  icone: Icons.arrow_forward_rounded,
                  pagina: Recuperar2Page(title: ''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
