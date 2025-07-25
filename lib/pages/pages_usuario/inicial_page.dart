import 'package:turisr/_core/widgets/botoes_replacement.dart';
import 'package:turisr/pages/pages_usuario/cadastro_page.dart';
import 'package:turisr/pages/pages_usuario/login_page.dart';
import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key, required this.title});

  final String title;

  @override
  State<InicialPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/imagens/logo_turisr.png',
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ),
                  Text(
                    "BEM-VINDO",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                spacing: 20,
                children: [
                  BotaoReplacement(
                    largura: 0.8,
                    altura: 0.09,
                    texto: 'Login',
                    pagina: LoginPage(title: ''),
                  ),

                  BotaoReplacement(
                    largura: 0.8,
                    altura: 0.09,
                    texto: 'Criar Conta',
                    pagina: CadastroPage(title: ''),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
