import 'package:dio/dio.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key, required this.title, this.usuario});

  final String title;
  final UsuarioModel? usuario;

  @override
  State<FavoritosPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FavoritosPage> {
  UsuarioModel usuario = UsuarioModel();

  Future<void> carregarFavoritos() async {
    try {
      Loading.show(context, mensagem: 'Carregando');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          validateStatus: (status) => status! < 500,
        ),
      );

      final response = await dio.get(
        'http://10.0.0.94/api_turismo/favoritos/${widget.usuario}',
      );

      var data = response.data;

      if (response.statusCode == 200) {
        usuario = UsuarioModel.fromJson(data["usuario"]);
        Loading.hide();
        setState(() {});
      }
      Loading.hide();
    } catch (e) {
      Loading.hide();
      showModalErro(context, 'Erro ao carregar favoritos!');
    }
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarFavoritos();
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
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.symmetric(vertical: 10.0),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Image.asset(
                        'assets/imagens/carnaval.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                      Text(
                        "Estação Ferroviária de São Roque",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("Endereço tal, rua tal"),
                    ],
                  ),
                ),
              );
            },
            itemCount: usuario.favoritos.length,
          ),
        ),
      ),

      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
