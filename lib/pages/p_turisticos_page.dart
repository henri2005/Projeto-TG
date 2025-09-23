import 'package:dio/dio.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/local_model.dart';
import 'package:turisr/pages/ponto_turistico_screen.dart';

class PontosTuristicosPage extends StatefulWidget {
  const PontosTuristicosPage({super.key, required this.title});

  final String title;

  @override
  State<PontosTuristicosPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PontosTuristicosPage> {
  List<LocalModel> listaPontos = [];
  List<LocalModel> itensListados = [];

  void carregarPontosTuristicos() async {
    try {
      Loading.show(context, mensagem: 'Carregando pontos turísticos...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 30),
          sendTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      String repository = 'http://10.0.0.94/api_turismo/locais/tipo/P';

      final response = await dio.get(repository);
      var data = response.data;

      if (response.statusCode == 200) {
        listaPontos =
            (data["locais"] as List)
                .map((ponto) => LocalModel.fromJson(ponto))
                .toList();
        listarPesquisas("");
        setState(() {});
      }

      Loading.hide();
    } catch (e) {
      print(e);
      Loading.hide();
      // ignore: use_build_context_synchronously
      showModalErro(context, 'Erro ao carregar dados!');
    }
  }

  void listarPesquisas(String consulta) async {
    if (consulta == "") {
      itensListados = listaPontos;
    } else {
      itensListados =
          listaPontos
              .where(
                (local) => local.nome.toLowerCase() == consulta.toLowerCase(),
              )
              .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarPontosTuristicos(); // só executa a função após carregar a árvore de widgets
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              LocalModel local = itensListados[index];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.3,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    padding: EdgeInsets.only(top: 12, left: 13),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 196, 196, 196),
                          offset: Offset(0, 6),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          local.nome,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        spacing: 5,
                        children: [
                          Image.asset(
                            local.caminhoImagem,
                            width: double.infinity,
                            height: 120,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    "${local.rua}, ${local.numero}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Column(
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    PontoTuristicoScreen(
                                                      ponto: local,
                                                    ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          'VEJA MAIS',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
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
                  ),
                ],
              );
            },
            itemCount: itensListados.length,
          ),
        ),
      ),

      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
