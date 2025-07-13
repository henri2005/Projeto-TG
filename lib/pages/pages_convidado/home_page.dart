import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/appbar_convidado.dart';
import 'package:turisr/_core/widgets/botoes.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/pages/pages_convidado/destaques_page.dart';
import 'package:flutter/material.dart';

class HomeConvidado extends StatefulWidget {
  const HomeConvidado({super.key, required this.title});

  final String title;

  @override
  State<HomeConvidado> createState() => _HomeConvidadoState();
}

class _HomeConvidadoState extends State<HomeConvidado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawerConvidado(context: context),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 22.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text(
                              "Pesquisar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Encontre os melhores destaques de São Roque",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.37,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 104, 104, 104),
                        width: 3.0,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 7,
                    children: [
                      Text("Conheça São Roque", style: TextStyle(fontSize: 25)),
                      Image.asset(
                        'assets/imagens/carnaval.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Botao(
                            texto: 'Veja Mais',
                            pagina: DestaqueConvidadoPage(title: ''),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.37,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 104, 104, 104),
                        width: 3.0,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 7,
                    children: [
                      Text(
                        "Evento em Destaque",
                        style: TextStyle(fontSize: 25),
                      ),
                      Image.asset(
                        'assets/imagens/carnaval.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Botao(
                            texto: 'Veja Mais',
                            pagina: DestaqueConvidadoPage(title: ''),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.37,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 104, 104, 104),
                        width: 3.0,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 7,
                    children: [
                      Text(
                        "Encontre os locais mais próximos de você!",
                        style: TextStyle(fontSize: 25),
                      ),
                      Image.asset(
                        'assets/imagens/portal.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Botao(texto: 'Veja Mais')],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
