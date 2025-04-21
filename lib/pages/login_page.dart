import 'package:emulando_figma/pages/cadastro_page.dart';
import 'package:emulando_figma/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.32,
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
                    ],
                  ),
                ),

                SizedBox(
                  child: Column(
                    spacing: 5,
                    children: [
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Usuário:", style: TextStyle(fontSize: 20)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 211, 211, 211),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(''),
                          ),
                        ],
                      ),

                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Senha:", style: TextStyle(fontSize: 20)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 211, 211, 211),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(''),
                          ),
                        ],
                      ),

                      Row(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey,
                          ),
                          Text("Lembrar-me"),
                          Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(4, 139, 168, 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(title: ''),
                            ),
                          );
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '------------------------',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(" ou ", style: TextStyle(fontSize: 16)),
                    Text(
                      '-----------------------',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),

                Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 199, 199),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Image.asset('assets/imagens/google.png', width: 45.0),
                          Text(
                            "Entrar com Google",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 199, 199),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Icon(Icons.person, size: 30),
                          Text(
                            "Entrar como Convidado",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Não tem uma conta? ",
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
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
                            style: TextStyle(
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
