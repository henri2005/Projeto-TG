import 'package:flutter/material.dart';
import 'package:turisr/_core/widgets/botoes.dart';
import 'package:turisr/pages/pages_usuario/login_page.dart';

class Recuperar2Page extends StatefulWidget {
  const Recuperar2Page({super.key, required this.title});

  final String title;

  @override
  State<Recuperar2Page> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Recuperar2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 40,
                  children: [
                    Text(
                      "Enviamos um código para o seu e-mail",
                      style: TextStyle(fontSize: 30),
                    ),

                    Text(
                      "Digite o código enviado para o email\nusuario01@gmail.com",
                      style: TextStyle(fontSize: 18),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blueGrey,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blueGrey,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blueGrey,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blueGrey,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blueGrey,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blueGrey,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Botao(texto: 'REENVIAR CÓDIGO', pagina: LoginPage(title: '')),
            ],
          ),
        ),
      ),
    );
  }
}
