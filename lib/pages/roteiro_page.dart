import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/roteiro_model.dart';
import 'package:turisr/classes/usuario_model.dart';

class RoteiroPage extends StatefulWidget {
  const RoteiroPage({super.key, this.usuarioLogado});

  final UsuarioModel? usuarioLogado;

  @override
  State<RoteiroPage> createState() => _RoteiroPageState();
}

class _RoteiroPageState extends State<RoteiroPage> {
  RoteiroModel locaisRoteiro = RoteiroModel();
  bool _clicado = false;
  final dados = GetStorage();
  final _controllerInicio = TextEditingController();
  final _controllerFim = TextEditingController();

  void carregarLocaisRoteiro() async {
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
        'http://10.0.0.94/api_turismo/roteiro/${widget.usuarioLogado!.username}',
      );
      var data = response.data;

      if (response.statusCode == 200) {
        if (data is String) {
          final jsonData = jsonDecode(data);
          final dataMap = jsonData as Map<String, dynamic>;
        } else if (data is Map<String, dynamic>) {
          final dataMap = data;
          locaisRoteiro = RoteiroModel.fromJson(dataMap["Roteiro"]);
          setState(() {});
        }
      } else {
        showModalErro(context, response.data['message']);
      }
    } catch (e) {
      showModalErro(
        context,
        "Ocorreu um erro ao carregar roteiro ${e.toString()}",
      );
    }
  }

  void montarRoteiro() async {
    try {
      Loading.show(context, mensagem: 'Montando seu roteiro...');
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
        'http://10.0.0.94/api_turismo/roteiro/gerar/${widget.usuarioLogado!.username}',
      );

      var data = response.data;
      print(data);

      if (response.statusCode == 201 || response.statusCode == 202) {
        Loading.hide();
        showModalConfirm(context, response.data['message']);
        setState(() {});
      } else {
        Loading.hide();
        showModalErro(context, response.data['message']);
      }
    } catch (e) {
      Loading.hide;
      showModalErro(context, "Ocorreu um erro ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarLocaisRoteiro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, headerColor: AppColors.menuColor),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuarioLogado,
        menuColor: AppColors.menuColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "Monte seu roteiro de viagem",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(14),
                  child: Column(
                    spacing: 20,
                    children: [
                      Text(
                        "Planeje a sua viagem por São Roque com nossa criação de roteiros!",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                      Text(
                        "Nossa IA vai te ajudar! Ela vai agrupar e juntar os seus pontos favoritos em um roteiro de viagem único para você, tornando a sua passagem em São Roque inesquecível!",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.21,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text(
                        "Dias de Viagem",
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),

                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: _controllerInicio,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira uma data de início!';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: _controllerFim,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira uma data de fim!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text(
                        "Locais adicionados",
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var local = locaisRoteiro;

                          return ListTile(
                            title: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    local.nome[index],
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: locaisRoteiro.nome.length,
                      ),
                    ],
                  ),
                ),

                _clicado
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Roteiro de Viagem de ${widget.usuarioLogado!.username}\n ${_controllerInicio.text} - ${_controllerFim.text}",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    fontSize: 22,
                                  ),
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var local = locaisRoteiro;

                                    return ListTile(
                                      title: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.05,
                                        child: Text(
                                          local.nome[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily:
                                                GoogleFonts.ubuntu().fontFamily,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: locaisRoteiro.nome.length,
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.72,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _clicado = false;
                                  });
                                },
                                child: Text(
                                  'REFAZER ROTEIRO',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.72,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            montarRoteiro();
                            setState(() {
                              _clicado = true;
                            });
                          },
                          child: Text(
                            "MONTAR ROTEIRO",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
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
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuarioLogado,
      ),
    );
  }
}
