import 'package:emulando_figma/pages/perfil_editar_page.dart';
import 'package:emulando_figma/pages/perfil_sobre_page.dart';
import 'package:flutter/material.dart';

class AppTurismo extends StatelessWidget {
  const AppTurismo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuriSR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const PerfilSobrePage(),
    );
  }
}
