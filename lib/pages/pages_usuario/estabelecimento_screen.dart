import 'package:flutter/material.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:turisr/classes/estabelecimento.dart';

class EstabelecimentoScreen extends StatelessWidget {
  const EstabelecimentoScreen({super.key, required this.estabelecimento});
  final Estabelecimento estabelecimento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 20,
            children: [
              Image.asset(
                estabelecimento.caminhoImagem,
                width: double.infinity,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            estabelecimento.nome,
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.favorite_border_rounded, size: 30),
                        ],
                      ),
                      subtitle: Text(estabelecimento.descricao),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    ListTile(
                      title: Text('Endereço', style: TextStyle(fontSize: 25)),
                      subtitle: Text(
                        '${estabelecimento.rua}, ${estabelecimento.numero}',
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    ListTile(
                      title: Text('Serviços', style: TextStyle(fontSize: 25)),
                      subtitle: Text('1'),
                      minTileHeight: 10,
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    ListTile(
                      title: Text(
                        'Avaliação Geral',
                        style: TextStyle(fontSize: 25),
                      ),
                      subtitle: Text('Lorem'),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "ADICIONAR AO ROTEIRO",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
