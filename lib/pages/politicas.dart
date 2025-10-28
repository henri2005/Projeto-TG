import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class PoliticasPage extends StatefulWidget {
  const PoliticasPage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<PoliticasPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PoliticasPage> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              spacing: 30,
              children: [
                Text(
                  "POLÍTICAS DE PRIVACIDADE",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "1. Introdução",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Esta Política de Privacidade descreve como o aplicativo TuriSR coleta, utiliza, armazena e protege os dados pessoais dos usuários. Ao utilizar o aplicativo, o usuário concorda com os termos aqui descritos.",
                ),

                Text(
                  "2. Dados Coletados",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O TuriSR poderá coletar os seguintes dados pessoais:\n\n   Nome, informações de login;\n\n   Preferências de viagem e histórico de roteiros;\n\n   Localização geográfica (caso autorizado pelo usuário);\n\n   Informações técnicas do dispositivo (modelo, sistema operacional, idioma).",
                ),

                Text(
                  "3. Finalidade do Tratamento",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Os dados são utilizados para:\n\n   Criar roteiros personalizados de viagem em São Roque;\n\n   Melhorar a experiência do usuário e recomendar atrações relevantes;\n\n   Enviar notificações e comunicações sobre o aplicativo (caso autorizado);\n\n   Garantir a segurança e integridade do serviço.",
                ),

                Text(
                  "4. Compartilhamento de Dados",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O TuriSR não compartilha dados pessoais com terceiros, exceto:\n\n   Quando necessário para o funcionamento do serviço (ex.: mapas, integração com redes sociais);\n\n   Em cumprimento de obrigações legais ou ordens judiciais;\n\n   Com parceiros comerciais, mediante consentimento explícito do usuário.",
                ),

                Text(
                  "5. Armazenamento e Segurança",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Os dados são armazenados em servidores seguros e protegidos por medidas técnicas e administrativas adequadas. O TuriSR adota práticas para prevenir acessos não autorizados, vazamentos ou alterações indevidas.",
                ),

                Text(
                  "6. Direitos de Usuário",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Nos termos da LGPD, o usuário tem direito a:\n\n   Confirmar a existência de tratamento de seus dados;\n\n   Acessar, corrigir ou excluir seus dados pessoais;\n\n   Revogar o consentimento a qualquer momento;\n\n   Solicitar a portabilidade ou anonimização dos dados.\n\nPara exercer esses direitos, o usuário pode entrar em contato pelo e-mail: suporte@turisr.com.br.",
                ),

                Text(
                  "7. Cookies e Tecnologias de Rastreamento",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "O aplicativo poderá utilizar cookies ou tecnologias similares para:\n\n   Melhorar o desempenho e funcionalidades;\n\n   Analisar padrões de uso;\n\n   Personalizar conteúdo e sugestões.\n\nO usuário pode gerenciar suas preferências de cookies nas configurações do dispositivo.",
                ),

                Text(
                  "8. Alterações na Política",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
                Text(
                  "Esta Política de Privacidade poderá ser atualizada periodicamente. Recomendamos que o usuário revise este documento regularmente. O uso contínuo do aplicativo após alterações implica concordância com os novos termos.",
                ),
              ],
            ),
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
