import 'package:emulando_figma/pages/favoritos_page.dart';
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
      home: const FavoritosPage(title: 'Product Listing'),
    );
  }
}
