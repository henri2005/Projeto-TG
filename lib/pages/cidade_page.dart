import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/pages/estabelecimentos_page.dart';

class CidadePage extends StatefulWidget {
  const CidadePage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<CidadePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CidadePage> {
  final box = GetStorage();
  late String temaEscuro = "isDark";
  late bool isdark = false;

  @override
  void initState() {
    super.initState();
    isdark = box.read(temaEscuro) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        headerColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
      ),
      endDrawer: getDrawer(
        context: context,
        usuarioLogado: widget.usuario,
        menuColor: isdark ? DarkColors.menuColor : AppColors.menuColor,
      ),
      backgroundColor:
          isdark ? DarkColors.backgroundColor : AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      spacing: 20,
                      children: [
                        Text(
                          "Conheça São Roque, a Terra do Vinho!",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/imagens/portal.png'),
                        Text(
                          "São Roque está localizada no interior do Estado de São Paulo, a cerca de 60 km da Capital. É popularmente conhecida como a Terra do Vinho, por suas culturas vinícolas férteis e variedade de produtos derivados da uva e muito prestigiados. Além de outros pontos muito conhecidos, como o Morro do Saboó.",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          "Fundada em 1657, São Roque tem seu nome graças ao seu padroeiro, Roque de Montpellier, grande defensor contra a peste e dos mais pobres. ",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),

                        Row(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      'HOME',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => EstabelecimentosPage(
                                            title: '',
                                            usuarioLogado: widget.usuario,
                                          ),
                                    ),
                                  );
                                },
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      'EXPLORAR',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              spacing: 10,
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.attach_money_rounded, size: 28),
                                    Text(
                                      "R\$ 3.500.000.000",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.people, size: 28),
                                    Text(
                                      "79.500 pessoas",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.thermostat, size: 28),
                                Text(
                                  "19ºC",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(
        context: context,
        usuarioLogado: widget.usuario,
        bottomColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
      ),
    );
  }
}
