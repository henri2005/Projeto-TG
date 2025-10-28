import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/pages/convidado/estabelecimentos_page.dart';
import 'package:turisr/pages/convidado/home_page.dart';
import 'package:turisr/pages/convidado/p_turisticos_page.dart';
import 'package:flutter/material.dart';

BottomAppBar getBottomBarConvidado({required BuildContext context}) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    height: MediaQuery.of(context).size.height * 0.1,
    color: AppColors.mainColor,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeConvidado()),
                );
              },
              icon: Icon(Icons.home, color: Colors.white, size: 30),
            ),
            Text("Home", style: TextStyle(fontSize: 11, color: Colors.white)),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EstabelecimentoConvidado(title: ''),
                  ),
                );
              },
              icon: Icon(
                Icons.local_dining_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              "Estabelecimentos",
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PontosTuristicosConvidado(title: ''),
                  ),
                );
              },
              icon: Icon(
                Icons.add_location_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              "P.Turísticos",
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}
