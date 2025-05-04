import 'package:emulando_figma/_core/appcolors.dart';
import 'package:emulando_figma/_core/widgets/appbar.dart';
import 'package:emulando_figma/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class RoteiroPage extends StatefulWidget {
  const RoteiroPage({super.key});

  @override
  State<RoteiroPage> createState() => _RoteiroPageState();
}

class _RoteiroPageState extends State<RoteiroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: Column(
              spacing: 20,
              children: [
                Text(
                  "Monte seu roteiro de viagem",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(14),
                  child: Column(
                    spacing: 20,
                    children: [
                      Text(
                        "Planeje a sua viagem por São Roque com nossa criação de roteiros!",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "Nossa IA vai te ajudar! Ela vai agrupar e juntar os seus pontos favoritos em um roteiro de viagem único para você, tornando a sua passagem em São Roque inesquecível!",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text("Dias de Viagem", style: TextStyle(fontSize: 23)),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text("__/__/____"),
                            ),

                            Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text("__/__/____"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text(
                        "Locais adicionados",
                        style: TextStyle(fontSize: 23),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height: MediaQuery.of(context).size.height * 0.09,
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(""),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height: MediaQuery.of(context).size.height * 0.09,
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(""),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height: MediaQuery.of(context).size.height * 0.09,
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(""),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height: MediaQuery.of(context).size.height * 0.09,
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(""),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.buttonColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "MONTAR ROTEIRO",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
