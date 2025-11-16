import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/classes/local_model.dart';
import 'package:turisr/classes/servico_model.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PontoTuristicoScreen extends StatefulWidget {
  const PontoTuristicoScreen({
    super.key,
    required this.ponto,
    this.servico,
    this.usuarioLogado,
  });
  final LocalModel ponto;
  final ServicoModel? servico;
  final UsuarioModel? usuarioLogado;

  @override
  State<PontoTuristicoScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PontoTuristicoScreen> {
  IconData icone = Icons.favorite_border_rounded;
  String textoRoteiro = "ADICIONAR AO ROTEIRO";
  Color corBotao = AppColors.buttonColor;

  IconData estrelas = Icons.star_border;
  Color corEstrelas = Colors.grey;
  int avaliacaoApp = 0;

  final box = GetStorage();
  late String key = 'isFavorite';
  late String adicionado = 'isAdicionado';
  late bool isFavorite = false;
  late bool isAdicionado = false;
  late String temaEscuro = "isDark";
  late bool isdark = false;

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

  @override
  void initState() {
    super.initState();
    key = 'favorite_${widget.ponto.idEstabelecimento}';
    adicionado = 'roteiro_${widget.ponto.idEstabelecimento}';
    isdark = box.read(temaEscuro) ?? false;
    isFavorite = box.read(key) ?? false;
    isAdicionado = box.read(adicionado) ?? false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarUsuario();
    });
  }

  void alternarFavorito() {
    setState(() {
      isFavorite = !isFavorite;
      box.write(key, isFavorite); // Salva o novo estado
    });
  }

  void alternarRoteiro() {
    setState(() {
      isAdicionado = !isAdicionado;
      box.write(adicionado, isAdicionado); // salva o novo estado do roteiro
    });
  }

  void favoritar() async {
    try {
      Loading.show(context, mensagem: 'Processando...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
          sendTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      final dados = FormData.fromMap({
        'favoritos':
            "${widget.ponto.nome}, ${widget.ponto.caminhoImagem} ${widget.ponto.rua}",
        'email': widget.usuarioLogado!.email,
      });
      print(dados);

      final response = await dio.post(
        'http://10.0.0.94/api_turismo/locais/favoritar/${widget.ponto.idEstabelecimento}',
        data: dados,
      );

      if (response.statusCode == 200) {
        Loading.hide();
        setState(() {});
      } else {
        Loading.hide();
        showModalErro(context, response.data['message']);
      }
    } catch (e) {
      Loading.hide();
      showModalErro(context, "Erro : $e");
    }
  }

  void adicionaRoteiro() async {
    try {
      Loading.show(context, mensagem: 'Processando...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
          sendTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final dados = FormData.fromMap({
        'roteiro': "${widget.ponto.nome}, ${widget.ponto.rua}",
        'email': widget.usuarioLogado!.email,
      });
      print(dados);

      final response = await dio.post(
        'http://10.0.0.94/api_turismo/locais/roteiro/${widget.ponto.idEstabelecimento}',
        data: dados,
      );

      if (response.statusCode == 200) {
        Loading.hide();

        setState(() {});
      } else {
        Loading.hide();
        showModalErro(context, response.data['message']);
      }
    } catch (e) {
      Loading.hide();
      showModalErro(context, "Erro : $e");
    }
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
          child: Column(
            spacing: 20,
            children: [
              Image.asset(widget.ponto.caminhoImagem, width: double.infinity),
              Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ListTile(
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.ponto.nome,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                favoritar();
                                alternarFavorito();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      isFavorite
                                          ? "Local adicionado aos favoritos!"
                                          : "Local removido dos favoritos!",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Endereço',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                            ),
                          ),
                          Text(
                            '${widget.ponto.rua}, ${widget.ponto.numero}',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              await launchUrl(
                                Uri.parse(
                                  "https://www.google.com/maps/@${widget.ponto.latitude},${widget.ponto.longitude},17z?entry=ttu&g_ep=EgoyMDI1MTAwMS4wIKXMDSoASAFQAw%3D%3D",
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color:
                                    isdark
                                        ? DarkColors.buttonColor
                                        : AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "IR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    ListTile(
                      title: Text(
                        'Serviços',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        widget.servico!.servicos,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.21,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Avaliação Geral',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                            ),
                          ),
                          Row(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              int.parse(widget.ponto.notaAvaliacao),
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 55,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(4, (index) {
                                      return TextButton(
                                        onPressed: () {
                                          if (estrelas == Icons.star_border) {
                                            setState(() {
                                              estrelas = Icons.star;
                                              corEstrelas = Colors.yellow;
                                              avaliacaoApp = index;
                                            });
                                          } else {
                                            setState(() {
                                              estrelas = Icons.star_border;
                                              corEstrelas = Colors.grey;
                                              avaliacaoApp = 0;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          estrelas,
                                          color: corEstrelas,
                                          size: 40,
                                        ),
                                      );
                                    }),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color:
                                    isdark
                                        ? DarkColors.buttonColor
                                        : AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "DEIXE A SUA!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color:
                        isdark
                            ? (isAdicionado
                                ? DarkColors.menuColor
                                : DarkColors.buttonColor)
                            : (isAdicionado
                                ? AppColors.menuColor
                                : AppColors.buttonColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {
                      adicionaRoteiro();
                      alternarRoteiro();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            isFavorite
                                ? "Local adicionado ao roteiro!"
                                : "Local removido ao roteiro!",
                            style: TextStyle(
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      isAdicionado
                          ? "LOCAL ADICIONADO"
                          : "ADICIONAR AO ROTEIRO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isAdicionado ? Colors.white : Colors.white,
                        fontSize: 22,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
