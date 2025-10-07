import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/classes/local_model.dart';
import 'package:turisr/classes/servico_model.dart';
import 'package:url_launcher/url_launcher.dart';

class EstabelecimentoScreen extends StatefulWidget {
  const EstabelecimentoScreen({
    super.key,
    required this.estabelecimento,
    this.servicos,
  });
  final LocalModel estabelecimento;
  final ServicoModel? servicos;

  @override
  State<EstabelecimentoScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EstabelecimentoScreen> {
  IconData icone = Icons.favorite_border_rounded;

  void favoritar() async {
    try {
      Loading.show(context, mensagem: 'Adicionando aos favoritos...');

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
        'http://10.0.0.94/api_turismo/favoritos/${widget.estabelecimento.idEstabelecimento}',
        data: {'id_usuario': 1},
      );

      if (response.statusCode == 202) {
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
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 20,
            children: [
              Image.asset(
                widget.estabelecimento.caminhoImagem,
                width: double.infinity,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.32,
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
                              widget.estabelecimento.nome,
                              style: TextStyle(fontSize: 25),
                            ),
                            IconButton(
                              onPressed: () {
                                if (icone == Icons.favorite_border_rounded) {
                                  // favoritar();
                                  setState(() {
                                    icone = Icons.favorite;
                                  });
                                } else {
                                  setState(() {
                                    icone = Icons.favorite_border_rounded;
                                  });
                                }
                              },
                              icon: Icon(icone, size: 30),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        widget.estabelecimento.descricao,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
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
                          Text('Endereço', style: TextStyle(fontSize: 25)),
                          Text(
                            '${widget.estabelecimento.rua}, ${widget.estabelecimento.numero}',
                            style: TextStyle(fontSize: 16),
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
                                  "https://www.google.com/maps/@${widget.estabelecimento.latitude},${widget.estabelecimento.longitude},17z?entry=ttu&g_ep=EgoyMDI1MTAwMS4wIKXMDSoASAFQAw%3D%3D",
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
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
                      title: Text('Serviços', style: TextStyle(fontSize: 25)),
                      subtitle: Text(
                        widget.servicos!.servicos,
                        style: TextStyle(fontSize: 20),
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
                            style: TextStyle(fontSize: 25),
                          ),
                          Row(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              int.parse(widget.estabelecimento.notaAvaliacao),
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
                            onPressed: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
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
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "ADICIONAR AO ROTEIRO",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
