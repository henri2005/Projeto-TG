import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/loading.dart';
import 'package:turisr/_core/modal.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/cadastro_page.dart';
import 'package:turisr/pages/convidado/home_page.dart';
import 'package:turisr/pages/home_page.dart';
import 'package:turisr/pages/recuperarsenha1_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  String? nomeUsuario;
  UsuarioModel usuarioLogado = UsuarioModel(
    idUsuario: '',
    email: '',
    senha: '',
  );
  bool? _salvarDados = false;
  final dados = GetStorage();

  void loginUsuario() async {
    try {
      Loading.show(context, mensagem: 'Logando usuário...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      final dadosLogin = FormData.fromMap({
        'email': _controllerUser.text,
        'senha': _controllerSenha.text,
      });

      final response = await dio.post(
        'http://10.0.0.94/api_turismo/login',
        data: dadosLogin,
      );

      if (response.statusCode == 202) {
        usuarioLogado.email = _controllerUser.text;
        usuarioLogado.senha = _controllerSenha.text;
        Loading.hide();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    MyHomePage(title: '', usuarioLogado: usuarioLogado),
          ),
        );
        setState(() {});
      } else {
        Loading.hide();
        showModalErro(context, response.data['message']);
      }
    } catch (e) {
      Loading.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
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

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        controller: _controllerUser,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Você deve preencher seu email!';
                          }

                          return null;
                        },
                      ),

                      TextFormField(
                        controller: _controllerSenha,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Você deve preencher sua senha!';
                          }

                          return null;
                        },
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RadioGroup<bool>(
                                groupValue: _salvarDados,
                                onChanged: (value) {
                                  setState(() {
                                    _salvarDados = value;
                                    dados.write(
                                      'Usuario',
                                      _controllerUser.text,
                                    );
                                    dados.write('Senha', _controllerSenha.text);
                                    print(
                                      "${dados.read('Usuario')} - ${dados.read('Senha')}",
                                    );
                                  });
                                },
                                child: Column(
                                  children: <Widget>[
                                    Radio<bool>(value: true, enabled: true),
                                  ],
                                ),
                              ),
                              Text(
                                'Lembrar-me',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                            ],
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => RecuperarPage(title: ''),
                                ),
                              );
                            },
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                TextButton(
                  onPressed: () async {
                    if (_controllerUser.text == '') {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Você precisa informar o usuário!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (_controllerSenha.text == '') {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Você precisa informar a senha!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      setState(() {
                        loginUsuario();
                      });
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
                          'LOGIN',
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
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Image.asset(
                              'assets/imagens/google.png',
                              width: 45.0,
                            ),
                            Text(
                              "Entrar com Google",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeConvidado(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Icons.person, size: 30),
                            Text(
                              "Entrar como Convidado",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Não tem uma conta? ",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroPage(title: ''),
                              ),
                            );
                          },
                          child: Text(
                            "Criar Conta",
                            style: TextStyle(
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
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
