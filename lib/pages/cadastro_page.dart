import 'package:emulando_figma/pages/login_page.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key, required this.title});

  final String title;

  @override
  State<CadastroPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
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
                          Text("Nome:", style: TextStyle(fontSize: 20)),
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
                          Text(
                            "Digite um nome de usuário:",
                            style: TextStyle(fontSize: 20),
                          ),
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

                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Confirmar senha:",
                            style: TextStyle(fontSize: 20),
                          ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0),
                            child: Text(
                              "Qual tipo de turismo/passeio você costuma fazer?",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 211, 211, 211),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 260.0),
                              child: Icon(
                                Icons.label_important_outline_sharp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "O que gosta de fazer em viagens?",
                            style: TextStyle(fontSize: 20),
                          ),
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

                      Padding(
                        padding: const EdgeInsets.only(right: 45.0),
                        child: Row(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                            ),
                            Text("Estou de acordo com a Política de Uso"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
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
                              builder: (context) => LoginPage(title: ''),
                            ),
                          );
                        },
                        child: Text(
                          "CADASTRAR",
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
                    Text(" ou ", style: TextStyle(fontSize: 20)),
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
                      width: MediaQuery.of(context).size.width * 0.7,
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Já tem conta? ", style: TextStyle(fontSize: 17)),
                        Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.underline,
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
