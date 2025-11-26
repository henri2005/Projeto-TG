import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/botoescomiconemenor.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/cidade_page.dart';
import 'package:turisr/pages/destaques_page.dart';
import 'package:turisr/pages/mapa_page.dart';
import 'package:flutter/material.dart';

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
        'http://10.0.0.94/api_turismo/usuario/${widget.usuarioLogado!.email}',
      );
    } catch (e) {
      Loading.hide();
    }
  }

  final box = GetStorage();
  late String temaEscuro = "isDark";
  late bool isdark = false;

  @override
  void initState() {
    super.initState();
    isdark = box.read(temaEscuro) ?? false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarUsuario();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        headerColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
      ),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuarioLogado,
        menuColor: isdark ? DarkColors.menuColor : AppColors.menuColor,
      ),
      backgroundColor:
          isdark ? DarkColors.backgroundColor : AppColors.backgroundColor,
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
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                      Image.asset(
                        'assets/imagens/saoroque.jpg',
                        width: MediaQuery.of(context).size.width * 0.9,
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
                            pagina: CidadePage(usuario: widget.usuarioLogado),
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
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
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
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
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
                            pagina: MapaPage(
                              usuarioLogado: widget.usuarioLogado,
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
        ),
      ),

      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuarioLogado,
        bottomColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
      ),
    );
  }
}
