import 'package:flutter/material.dart';
import 'package:turisr/_core/appcolors.dart';

class BotaoReplacement extends StatelessWidget {
  const BotaoReplacement({
    super.key,
    required this.texto,
    required this.largura,
    required this.altura,
    this.pagina,
  });

  final String texto;
  final Widget? pagina;
  final double largura;
  final double altura;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * largura,
      height: MediaQuery.of(context).size.height * altura,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.buttonColor,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => pagina!),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 20,
          children: [
            Text(texto, style: TextStyle(fontSize: 30, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
