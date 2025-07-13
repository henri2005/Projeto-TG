import 'package:turisr/pages/pages_usuario/inicial_page.dart';
import 'package:flutter/material.dart';

class AppTurismo extends StatelessWidget {
  const AppTurismo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuriSR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const InicialPage(title: ''),
    );
  }
}
