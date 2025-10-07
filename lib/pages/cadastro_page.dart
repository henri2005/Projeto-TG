import 'package:dio/dio.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/login_page.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key, required this.title});

  final String title;

  @override
  State<CadastroPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CadastroPage> {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerTipo = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<UsuarioModel> listaUsers = [];

  Future cadastraUsuario() async {
    try {
      Loading.show(context, mensagem: 'Cadastrando o usuário...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          sendTimeout: Duration(seconds: 5),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      final dados = FormData.fromMap({
        'nome': _controllerNome.text,
        'usuario': _controllerUser.text,
        'senha': _controllerSenha.text,
        'tipo_turismo': _controllerTipo.text,
      });

      final response = await dio.post(
        'http://10.0.0.94/api_turismo/usuarios',
        data: dados,
      );

      if (response.statusCode == 201) {
        Loading.hide();
        Navigator.pop(context);
        setState(() {});
      } else {
        Loading.hide();
        showModalErro(context, response.data['message']);
      }
    } catch (e) {
      Loading.hide();
      showModalErro(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/imagens/logo_turisr.png',
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                      ),
                    ],
                  ),
                ),

                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      spacing: 15,
                      children: [
                        TextFormField(
                          controller: _controllerNome,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            labelText: 'Nome',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Você deve informar seu nome!';
                            }

                            return null;
                          },
                        ), // espaço entre o label e o campo

                        TextFormField(
                          controller: _controllerUser,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            labelText: 'Usuário',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Você deve informar seu usuário!';
                            }

                            return null;
                          },
                        ), // espaço entre o label e o campo

                        TextFormField(
                          controller: _controllerSenha,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Você deve informar sua senha!';
                            }

                            return null;
                          },
                        ), // espaço entre o label e o campo

                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _controllerTipo,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            labelText: 'Informe um tipo de turismo',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Você deve informar um tipo de turismo!';
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    children: [
                      Radio(value: "false", activeColor: AppColors.buttonColor),
                      Text("Estou de acordo com a Política de Uso"),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      cadastraUsuario();
                    }
                  },
                  child: Text("CADASTRO"),
                ),

                Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 225, 225, 225),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Image.asset('assets/imagens/google.png', width: 45.0),
                          Text(
                            "Entrar com Google",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Já tem conta? ", style: TextStyle(fontSize: 17)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(title: ''),
                              ),
                            );
                          },
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
