import 'package:flutter/material.dart';

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
                  spacing: 60,
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

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.cyan[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 15,
                  children: [
                    Text(
                      "REENVIAR CÓDIGO",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
