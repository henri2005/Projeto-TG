import 'package:turisr/_core/widgets/botoes_replacement.dart';
import 'package:turisr/_core/widgets/input.dart';
import 'package:turisr/pages/pages_usuario/cadastro_page.dart';
import 'package:turisr/pages/pages_usuario/home_page.dart';
import 'package:turisr/pages/pages_usuario/recuperarsenha1_page.dart';
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
    String groupValue = 'Yes';
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
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
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    spacing: 5,
                    children: [
                      Input(visibilidade: true, label: 'Nome/Usuário: '),

                      Input(visibilidade: true, label: 'Senha: '),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: "false",
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value!;
                                  });
                                },
                              ),
                              Text("Lembrar-me"),
                            ],
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => RecuperarPage(title: ''),
                                ),
                              );
                            },
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                BotaoReplacement(
                  largura: 0.8,
                  altura: 0.09,
                  texto: 'LOGIN',
                  pagina: MyHomePage(title: ''),
                ),

                Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 225, 225, 225),
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
                        color: const Color.fromARGB(255, 225, 225, 225),
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
