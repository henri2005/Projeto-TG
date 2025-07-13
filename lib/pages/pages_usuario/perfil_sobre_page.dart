import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class PerfilSobrePage extends StatelessWidget {
  const PerfilSobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Sobre", style: TextStyle(fontSize: 26)),
                  Icon(Icons.arrow_downward_sharp, size: 40),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Sobre", style: TextStyle(fontSize: 20)),
                  Icon(Icons.arrow_forward_outlined, size: 40),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Sobre", style: TextStyle(fontSize: 20)),
                  Icon(Icons.arrow_forward_outlined, size: 40),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Sobre", style: TextStyle(fontSize: 20)),
                  Icon(Icons.arrow_forward_outlined, size: 40),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Sobre", style: TextStyle(fontSize: 20)),
                  Icon(Icons.arrow_forward_outlined, size: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
