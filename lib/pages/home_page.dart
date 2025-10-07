import 'package:dio/dio.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/botoescomiconemenor.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/cidade_page.dart';
import 'package:turisr/pages/destaques_page.dart';
import 'package:turisr/pages/estabelecimentos_page.dart';
import 'package:turisr/pages/favoritos_page.dart';
import 'package:turisr/pages/mapa_page.dart';
import 'package:flutter/material.dart';
import 'package:turisr/pages/p_turisticos_page.dart';
import 'package:turisr/pages/perfil_page.dart';
import 'package:turisr/pages/roteiro_page.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.usuarioLogado});

  final String title;
  final UsuarioModel? usuarioLogado;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void carregarUsuario() async {
    try {
      print(widget.usuarioLogado!.username);
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          sendTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      final response = await dio.get(
        'http://10.0.0.94/api_turismo/usuario/${widget.usuarioLogado!.username}',
      );

      var data = response.data;
      print(data);
    } catch (e) {
      Loading.hide();
    }
  }

  void deslogar() async {
    Loading.show(context, mensagem: 'Saindo da conta...');
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    final response = await dio.put(
      'http://10.0.0.94/api_turismo/deslogin/${widget.usuarioLogado!.username}',
    );

    if (response.statusCode == 200) {
      Loading.hide();
      Navigator.popUntil(context, (context) => context.isFirst);
    }

    Loading.hide();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarUsuario();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        deslogar();
      },
      child: Scaffold(
        appBar: getAppBar(context: context),
        endDrawer: Drawer(
          backgroundColor: AppColors.menuColor,
          child: Container(
            margin: EdgeInsets.only(top: 90),
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              spacing: 45,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_city, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CidadePage()),
                        );
                      },
                      child: Text(
                        "A Cidade",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.map, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapaPage()),
                        );
                      },
                      child: Text(
                        "Mapa",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.local_dining_sharp, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => EstabelecimentosPage(title: ''),
                          ),
                        );
                      },
                      child: Text(
                        "Estabelecimentos",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.add_location_rounded, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PontosTuristicosPage(title: ''),
                          ),
                        );
                      },
                      child: Text(
                        "Pontos Turísticos",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.edit_road, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoteiroPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Roteiro de Viagem",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.topic, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestaquesPage(title: ''),
                          ),
                        );
                      },
                      child: Text(
                        "Destaques",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.favorite, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    FavoritosPage(nomeUsuario: 'henry_turi'),
                          ),
                        );
                      },
                      child: Text(
                        "Favoritos",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.person_pin, size: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    PerfilPage(usuario: widget.usuarioLogado),
                          ),
                        );
                      },
                      child: Text(
                        "Perfil do Usuário",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                              pagina: CidadePage(),
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
                              pagina: DestaquesPage(title: ''),
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
                              pagina: MapaPage(),
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

        bottomNavigationBar: getBottomBar(context: context),
      ),
    );
  }
}
