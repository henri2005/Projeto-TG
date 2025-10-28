import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class TermosPage extends StatefulWidget {
  const TermosPage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<TermosPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TermosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, headerColor: AppColors.menuColor),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuario,
        menuColor: AppColors.menuColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              spacing: 30,
              children: [
                Text(
                  "TERMOS DE USO DO APLICATIVO",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "1. Aceitação dos Termos",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Ao acessar ou utilizar o aplicativo TuriSR, o usuário concorda com os presentes Termos de Uso e com a Política de Privacidade. Caso não concorde, o usuário deve se abster de utilizar o aplicativo.",
                ),

                Text(
                  "2. Descrição do Serviço",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O TuriSR é um aplicativo voltado à criação personalizada de roteiros turísticos na cidade de São Roque, oferecendo sugestões de atrações, restaurantes, vinícolas, trilhas e outros pontos de interesse com base nas preferências do usuário.",
                ),

                Text(
                  "3. Cadastro e Conta do Usuário",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Para utilizar determinadas funcionalidades, o usuário poderá ser solicitado a criar uma conta. O usuário é responsável por manter a confidencialidade de suas credenciais de acesso. É proibido o uso de informações falsas ou de terceiros sem autorização.",
                ),

                Text(
                  "4. Uso Permitido",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O usuário compromete-se a utilizar o TuriSR apenas para fins lícitos e pessoais, respeitando as leis vigentes e os direitos de terceiros. É vedado: Utilizar o aplicativo para fins comerciais sem autorização prévia; Tentar acessar áreas restritas ou modificar o funcionamento do aplicativo; Compartilhar conteúdo ofensivo, ilegal ou que viole direitos autorais.",
                ),

                Text(
                  "5. Conteúdo e Propriedade Intelectual",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Todo o conteúdo disponibilizado pelo TuriSR — incluindo textos, imagens, logotipos, mapas e sugestões de roteiro — é protegido por direitos autorais e pertence ao TuriSR ou a seus parceiros. O uso indevido poderá acarretar responsabilização civil e criminal.",
                ),

                Text(
                  "6. Responsabilidades e Limitações",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O TuriSR se esforça para manter as informações atualizadas, mas não garante a precisão ou disponibilidade contínua dos serviços. O aplicativo não se responsabiliza por eventuais prejuízos decorrentes de informações incorretas, alterações em horários de funcionamento de estabelecimentos ou problemas com terceiros indicados nos roteiros.",
                ),

                Text(
                  "7. Privacidade",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O tratamento de dados pessoais será realizado conforme a Política de Privacidade do TuriSR, em conformidade com a Lei Geral de Proteção de Dados (LGPD).",
                ),

                Text(
                  "8. Modificações nos Termos",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O TuriSR poderá alterar estes Termos de Uso a qualquer momento. As alterações entrarão em vigor após sua publicação no aplicativo. O uso contínuo do serviço implica concordância com os novos termos.",
                ),

                Text(
                  "9. Foro",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Fica eleito o foro da Comarca de São Roque/SP para dirimir quaisquer questões oriundas destes Termos, com renúncia a qualquer outro, por mais privilegiado que seja.",
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
