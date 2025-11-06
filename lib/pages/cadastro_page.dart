import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
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
        'email': _controllerUser.text,
        'senha': _controllerSenha.text,
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
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Você deve informar seu Email!';
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
                      Text(
                        "Estou de acordo com a Política de Uso",
                        style: TextStyle(
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),

                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      cadastraUsuario();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'CADASTRAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Column(
                  spacing: 20,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Já tem conta? ",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                          ),
                        ),
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
