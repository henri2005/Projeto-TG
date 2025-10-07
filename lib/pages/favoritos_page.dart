import 'package:dio/dio.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/favoritos_model.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key, this.nomeUsuario});

  final String? nomeUsuario;

  @override
  State<FavoritosPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FavoritosPage> {
  FavoritosModel favoritos = FavoritosModel();

  void carregarFavoritos() async {
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
        'http://10.0.0.94/api_turismo/favoritos/${widget.nomeUsuario}',
      );
      var data = response.data;

      if (response.statusCode == 200) {
        Loading.hide();

        if (response.data is Map<String, dynamic>) {
          final dataMap = data as Map<String, dynamic>;
          favoritos = FavoritosModel.fromJson(dataMap["Favoritos"]);
        }
        setState(() {});
      }
      Loading.hide();
    } catch (e) {
      Loading.hide();
      showModalErro(context, "'Erro ao carregar favoritos!', ${e.toString()}");
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
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var local = favoritos;

              return Container(
                height: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      local.nome[index],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(local.rua[index], style: TextStyle(fontSize: 20)),
                  ],
                ),
              );
            },
            itemCount: favoritos.nome.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          carregarFavoritos();
        },
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
