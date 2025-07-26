import 'package:flutter/material.dart';
import 'package:turisr/_core/appcolors.dart';

class BotaoIconeMenor extends StatelessWidget {
  const BotaoIconeMenor({
    super.key,
    required this.texto,
    required this.largura,
    required this.altura,
    this.pagina,
    this.icone,
  });

  final String texto;
  final Widget? pagina;
  final IconData? icone;
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
            Text(texto, style: TextStyle(fontSize: 20, color: Colors.white)),
            Icon(icone, color: Colors.white, size: 40),
          ],
        ),
      ),
    );
  }
}
