import 'package:flutter/material.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottomconvidado.dart';
import 'package:turisr/pages/convidado/estabelecimentos_page.dart';
import 'package:turisr/pages/convidado/home_page.dart';

class CidadeConvidado extends StatelessWidget {
  const CidadeConvidado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawerConvidado(context: context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.82,
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeConvidado(),
                                    ),
                                  );
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
                                          (context) => EstabelecimentoConvidado(
                                            title: '',
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: getBottomBarConvidado(context: context),
    );
  }
}
