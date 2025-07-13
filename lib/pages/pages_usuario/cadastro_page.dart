import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/botoes_replacement.dart';
import 'package:turisr/_core/widgets/input.dart';
import 'package:turisr/pages/pages_usuario/login_page.dart';
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
    String groupValue = '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
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
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    spacing: 5,
                    children: [
                      Input(visibilidade: true, label: 'Nome'),

                      Input(
                        visibilidade: true,
                        label: 'Digite um nome de usuário',
                      ),

                      Input(visibilidade: true, label: 'Senha'),

                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Qual tipo de turismo/passeio você costuma fazer?',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ), // espaço entre o label e o campo
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color:
                                      AppColors
                                          .mainColor, // mesma cor da borda ao focar
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppColors.mainColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),

                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'O que gosta de fazer em viagens?',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ), // espaço entre o label e o campo
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color:
                                      AppColors
                                          .mainColor, // mesma cor da borda ao focar
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppColors.mainColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    children: [
                      Radio(
                        value: "false",
                        activeColor: AppColors.buttonColor,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value!;
                          });
                        },
                      ),
                      Text("Estou de acordo com a Política de Uso"),
                    ],
                  ),
                ),

                BotaoReplacement(
                  altura: 0.09,
                  largura: 0.8,
                  texto: 'CADASTRO',
                  pagina: LoginPage(title: ''),
                ),

                Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Já tem conta? ", style: TextStyle(fontSize: 17)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(title: ''),
                              ),
                            );
                          },
                          child: Text(
                            "Entrar",
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
