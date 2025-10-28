import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/favoritos_model.dart';
import 'package:turisr/classes/usuario_model.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key, this.usuarioLogado});

  final UsuarioModel? usuarioLogado;

  @override
  State<FavoritosPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FavoritosPage> {
  FavoritosModel favoritos = FavoritosModel();
  String erro = "";

  void carregarFavoritos() async {
    print(widget.usuarioLogado!.username);
    try {
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          validateStatus: (status) => status! < 500,
        ),
      );

      final response = await dio.get(
        "http://10.0.0.94/api_turismo/favoritos/${widget.usuarioLogado!.username}",
      );
      var data = response.data;

      if (response.statusCode == 200) {
        Loading.hide();

        if (data is String) {
          final jsonData = jsonDecode(data);
          final dataMap = jsonData as Map<String, dynamic>;

          print(dataMap);
        } else if (data is Map<String, dynamic>) {
          final dataMap = data;
          favoritos = FavoritosModel.fromJson(dataMap["Favoritos"]);
          setState(() {});
        } else if (data is List) {
          print('API retornou como List');
        }
      } else {
        showModalErro(context, data['message']);
        erro = data['message'];
      }
    } catch (e) {
      showModalErro(context, "Erro ao carregar favoritos!, ${e.toString()}");
    }
  }

  void desfavoritar() async {
    try {
      Loading.show(context, mensagem: 'Adicionando aos favoritos...');

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
            "${favoritos.id}, ${favoritos.nome}, ${favoritos.caminhoImagem}, ${favoritos.rua}",
        'username': widget.usuarioLogado!.username,
      });
      print(dados);

      final response = await dio.post(
        'http://10.0.0.94/api_turismo/locais/desfavoritar/${int.parse(favoritos.id as String)}',
        data: dados,
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarFavoritos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, headerColor: AppColors.mainColor),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuarioLogado,
        menuColor: AppColors.menuColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var local = favoritos;

              if (favoritos.nome == null || favoritos.nome.isEmpty) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(erro),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 13.0),
                      child: Text(
                        local.nome[index],
                        style: TextStyle(
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    subtitle: Column(
                      spacing: 15,
                      children: [
                        Image.asset(local.caminhoImagem[index], scale: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              local.rua[index],
                              style: TextStyle(
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                // desfavoritar();
                                local.id.removeAt(index);
                                local.nome.removeAt(index);
                                local.caminhoImagem.removeAt(index);
                                local.rua.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(Icons.favorite, size: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            itemCount: favoritos.nome.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          carregarFavoritos();
        },
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuarioLogado,
        bottomColor: AppColors.mainColor,
      ),
    );
  }
}
