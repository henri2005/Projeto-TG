import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/botoescomiconemenor.dart';
import 'package:turisr/_core/widgets/bottomconvidado.dart';
import 'package:turisr/pages/convidado/cidade_page.dart';
import 'package:turisr/pages/convidado/destaques_page.dart';
import 'package:turisr/pages/convidado/mapa_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeConvidado extends StatefulWidget {
  const HomeConvidado({super.key});

  @override
  State<HomeConvidado> createState() => _HomeConvidadoState();
}

class _HomeConvidadoState extends State<HomeConvidado> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {},
      child: Scaffold(
        appBar: getAppBar(context: context, headerColor: AppColors.mainColor),
        endDrawer: getDrawerConvidado(context: context),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 20,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.37,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(68, 153, 152, 152),
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 7,
                      children: [
                        Text(
                          "Conheça São Roque",
                          style: TextStyle(fontSize: 25),
                        ),
                        Image.asset(
                          'assets/imagens/saoroque.jpg',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BotaoIconeMenor(
                              largura: 0.45,
                              altura: 0.06,
                              icone: Icons.arrow_forward_rounded,
                              texto: 'Veja Mais',
                              pagina: CidadeConvidado(),
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
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(68, 153, 152, 152),
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                        ),
                      ],
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
                            BotaoIconeMenor(
                              largura: 0.45,
                              altura: 0.06,
                              icone: Icons.arrow_forward_rounded,
                              texto: 'Veja Mais',
                              pagina: DestaquesConvidado(title: ''),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.41,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(68, 153, 152, 152),
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                        ),
                      ],
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
                          children: [
                            BotaoIconeMenor(
                              largura: 0.45,
                              altura: 0.06,
                              icone: Icons.arrow_forward_rounded,
                              texto: 'Veja Mais',
                              pagina: MapaConvidado(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: getBottomBarConvidado(context: context),
      ),
    );
  }
}
