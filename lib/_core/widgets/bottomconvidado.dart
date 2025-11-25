import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/pages/convidado/estabelecimentos_page.dart';
import 'package:turisr/pages/convidado/home_page.dart';
import 'package:turisr/pages/convidado/p_turisticos_page.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;

void _onItemPressed(int index) {
  _selectedIndex = index;
}

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
                _onItemPressed(0);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeConvidado()),
                );
              },
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            Text(
              "Home",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                _onItemPressed(1);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EstabelecimentoConvidado(title: ''),
                  ),
                );
              },
              icon: Icon(
                Icons.local_dining_sharp,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            Text(
              "Estabelecimentos",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                _onItemPressed(2);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PontosTuristicosConvidado(title: ''),
                  ),
                );
              },
              icon: Icon(
                Icons.add_location_rounded,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            Text(
              "P.Turísticos",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
