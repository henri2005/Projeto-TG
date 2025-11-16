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
  bool? termosLidos = false;

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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Usuário cadastrado com sucesso!",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        );
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
                      RadioGroup<bool>(
                        groupValue: termosLidos,
                        onChanged: (value) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Termos de Uso',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    Text(
                                      "1. Aceitação dos Termos",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "Ao acessar ou utilizar o aplicativo TuriSR, o usuário concorda com os presentes Termos de Uso e com a Política de Privacidade. Caso não concorde, o usuário deve se abster de utilizar o aplicativo.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "2. Descrição do Serviço",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "O TuriSR é um aplicativo voltado à criação personalizada de roteiros turísticos na cidade de São Roque, oferecendo sugestões de atrações, restaurantes, vinícolas, trilhas e outros pontos de interesse com base nas preferências do usuário.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "3. Cadastro e Conta do Usuário",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "Para utilizar determinadas funcionalidades, o usuário poderá ser solicitado a criar uma conta. O usuário é responsável por manter a confidencialidade de suas credenciais de acesso. É proibido o uso de informações falsas ou de terceiros sem autorização.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "4. Uso Permitido",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "O usuário compromete-se a utilizar o TuriSR apenas para fins lícitos e pessoais, respeitando as leis vigentes e os direitos de terceiros. É vedado: Utilizar o aplicativo para fins comerciais sem autorização prévia; Tentar acessar áreas restritas ou modificar o funcionamento do aplicativo; Compartilhar conteúdo ofensivo, ilegal ou que viole direitos autorais.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "5. Conteúdo e Propriedade Intelectual",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "Todo o conteúdo disponibilizado pelo TuriSR — incluindo textos, imagens, logotipos, mapas e sugestões de roteiro — é protegido por direitos autorais e pertence ao TuriSR ou a seus parceiros. O uso indevido poderá acarretar responsabilização civil e criminal.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "6. Responsabilidades e Limitações",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "O TuriSR se esforça para manter as informações atualizadas, mas não garante a precisão ou disponibilidade contínua dos serviços. O aplicativo não se responsabiliza por eventuais prejuízos decorrentes de informações incorretas, alterações em horários de funcionamento de estabelecimentos ou problemas com terceiros indicados nos roteiros.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "7. Privacidade",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "O tratamento de dados pessoais será realizado conforme a Política de Privacidade do TuriSR, em conformidade com a Lei Geral de Proteção de Dados (LGPD).",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "8. Modificações nos Termos",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "O TuriSR poderá alterar estes Termos de Uso a qualquer momento. As alterações entrarão em vigor após sua publicação no aplicativo. O uso contínuo do serviço implica concordância com os novos termos.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),

                                    Text(
                                      "9. Foro",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "Fica eleito o foro da Comarca de São Roque/SP para dirimir quaisquer questões oriundas destes Termos, com renúncia a qualquer outro, por mais privilegiado que seja.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.buttonColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            'Não Aceito',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily:
                                                  GoogleFonts.ubuntu()
                                                      .fontFamily,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            termosLidos = value;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.buttonColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            'Aceito',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily:
                                                  GoogleFonts.ubuntu()
                                                      .fontFamily,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                scrollable: true,
                              );
                            },
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Radio<bool>(value: true, enabled: true),
                          ],
                        ),
                      ),
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
