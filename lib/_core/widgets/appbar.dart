import 'package:emulando_figma/_core/appcolors.dart';
import 'package:flutter/material.dart';

AppBar getAppBar({required BuildContext context, String? title}) {
  return AppBar(
    backgroundColor: AppColors.mainColor,
    toolbarHeight: MediaQuery.of(context).size.height * 0.12,
    leadingWidth: MediaQuery.of(context).size.width,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset('assets/imagens/logo_turisr.png', height: 80.0),
        ),
      ],
    ),
    iconTheme: IconThemeData(size: 60, opacity: 0.9),
  );
}

Drawer getDrawer() {
  return Drawer(
    backgroundColor: AppColors.menuColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: Text("Mapa", style: TextStyle(fontSize: 20)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Estabelecimentos", style: TextStyle(fontSize: 20)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Pontos Turísticos", style: TextStyle(fontSize: 20)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Roteiro de Viagem", style: TextStyle(fontSize: 20)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Destaques", style: TextStyle(fontSize: 20)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Favoritos", style: TextStyle(fontSize: 20)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Perfil do Usuário", style: TextStyle(fontSize: 20)),
        ),
      ],
    ),
  );
}
