import 'package:dio/dio.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class PerfilEditarPage extends StatefulWidget {
  const PerfilEditarPage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<PerfilEditarPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PerfilEditarPage> {
  final _controllerUser = TextEditingController();
  final _controllerSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UsuarioModel usuarioPerfil = UsuarioModel(
    idUsuario: '',
    username: '',
    senha: '',
  );
  var idUsuario = "";

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
        if (response.data is Map<String, dynamic>) {
          final dataMap = data as Map<String, dynamic>;
          usuarioPerfil = UsuarioModel.fromJson(dataMap["usuario"]);
          setState(() {});
        }
      } else {
        showModalErro(context, data["message"]);
      }
    } catch (e) {
      showModalErro(context, e.toString());
    }
  }

  Future editaUsuario() async {
    try {
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

      // inserção dos dados do usuário
      final dados =
          'usuario=${_controllerUser.text}&senha=${_controllerSenha.text}';

      final response = await dio.put(
        'http://10.0.0.94/api_turismo/usuarios/$idUsuario',
        data: dados,
      );
      var dataEdicao = response.data;
      print(dataEdicao);

      if (response.statusCode == 202) {
        showModalConfirm(context, 'Usuário atualizado com sucesso!');
        Navigator.pop(context, true);
      } else {
        showModalErro(context, dataEdicao['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    carregarInfoUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, headerColor: AppColors.mainColor),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuario,
        menuColor: AppColors.menuColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(Icons.arrow_back, size: 28),
                      Text("Cancelar", style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ),

              Form(
                key: _formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    TextFormField(
                      controller: _controllerUser,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Novo nome de usuário',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o novo nome!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _controllerSenha,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Nova senha',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a nova senha!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    editaUsuario();
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    color: AppColors.buttonColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        "SALVAR",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuario,
        bottomColor: AppColors.mainColor,
      ),
    );
  }
}
