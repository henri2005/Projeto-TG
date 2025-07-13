import 'package:flutter/material.dart';
import 'package:turisr/_core/appcolors.dart';

class Botao extends StatelessWidget {
  const Botao({super.key, required this.texto, this.pagina});

  final String texto;
  final Widget? pagina;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.buttonColor,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pagina!),
          );
        },
        child: Text(texto, style: TextStyle(fontSize: 22, color: Colors.white)),
      ),
    );
  }
}
