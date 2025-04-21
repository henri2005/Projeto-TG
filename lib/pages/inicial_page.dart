import 'package:emulando_figma/pages/cadastro_page.dart';
import 'package:emulando_figma/pages/login_page.dart';
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
                      'assets/imagens/logo.png',
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 22, 122, 189),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(title: ''),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 22, 122, 189),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CadastroPage(title: ''),
                            ),
                          );
                        },
                        child: Text(
                          "Criar Conta",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
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
