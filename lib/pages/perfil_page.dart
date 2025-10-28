import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/classes/favoritos_model.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/perfil_editar_page.dart';
import 'package:turisr/pages/perfil_sobre_page.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<PerfilPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PerfilPage> {
  FavoritosModel favoritos = FavoritosModel();
  UsuarioModel usuarioPerfil = UsuarioModel(
    idUsuario: '',
    username: '',
    senha: '',
  );
  String idUsuario = "";
  final box = GetStorage();
  Color corFundo = Colors.white;
  late String temaEscuro = "isDark";
  late bool isdark = false;

  void carregarInfoUsuarios() async {
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
        'http://10.0.0.94/api_turismo/usuario/${widget.usuario!.username}',
      );

      var data = response.data;
      var id = data["usuario"]["id_usuario"];
      print(id);
      idUsuario = id;

      if (response.statusCode == 200) {
        Loading.hide();

        if (response.data is Map<String, dynamic>) {
          final dataMap = data as Map<String, dynamic>;
          usuarioPerfil = UsuarioModel.fromJson(dataMap["usuario"]);
          carregarFavoritos();
          setState(() {});
        }
      } else {
        showModalErro(context, data["message"]);
      }
    } catch (e) {
      showModalErro(context, e.toString());
    }
  }

  Future<void> deletaUsuario() async {
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

      final response = await dio.delete(
        'http://10.0.0.94/api_turismo/usuarios/$idUsuario',
      );

      var data = response.data;
      print(data);

      if (response.statusCode == 202) {
        Loading.hide();
        Navigator.popUntil(context, (context) => context.isFirst);
      } else {
        showModalErro(context, data["message"]);
      }
    } catch (e) {
      showModalErro(context, e.toString());
    }
  }

  void carregarFavoritos() async {
    print(widget.usuario!.username);
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
        "http://10.0.0.94/api_turismo/favoritos/${widget.usuario!.username}",
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
      }
    } catch (e) {
      showModalErro(context, "Erro ao carregar favoritos!, ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    isdark = box.read(temaEscuro) ?? false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarInfoUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        headerColor: isdark ? DarkColors.menuColor : AppColors.menuColor,
      ),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuario,
        menuColor: AppColors.menuColor,
      ),
      backgroundColor:
          isdark ? DarkColors.backgroundColor : AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              spacing: 30,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () async {
                        deletaUsuario();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                          color:
                              isdark ? DarkColors.containerColor : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Icons.delete, size: 28),
                            Text(
                              "Excluir",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                          (context) => context.isFirst,
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                          color:
                              isdark ? DarkColors.containerColor : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Icons.exit_to_app, size: 28),
                            Text(
                              "Sair",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      child: Icon(Icons.person, size: 80),
                    ),
                    Text(
                      "${widget.usuario!.username}",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                        color: isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),

                TextButton(
                  onPressed: () async {
                    var retorno = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                PerfilEditarPage(usuario: widget.usuario!),
                      ),
                    );

                    if (retorno != null && retorno == true) {
                      carregarInfoUsuarios();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: isdark ? DarkColors.containerColor : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(Icons.edit, size: 28),
                        Text(
                          "Editar",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Text(
                        "Locais favoritados",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var local = favoritos;

                          return ListTile(
                            title: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color:
                                    isdark
                                        ? DarkColors.containerColor
                                        : Colors.white,
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
                        itemCount: favoritos.nome.length,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.81,
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: Column(
                    spacing: 10,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                          color:
                              isdark ? DarkColors.containerColor : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sobre",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => PerfilSobrePage(
                                            usuario: widget.usuario!,
                                          ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.arrow_right, size: 45),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                          color:
                              isdark ? DarkColors.containerColor : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Acessibilidade",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.square_outlined, size: 45),
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
        ),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuario,
      ),
    );
  }
}
