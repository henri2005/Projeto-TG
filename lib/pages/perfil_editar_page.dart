import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/usuario_model.dart';

class PerfilEditarPage extends StatefulWidget {
  const PerfilEditarPage({super.key, this.usuario});

  final UsuarioModel? usuario;

  @override
  State<PerfilEditarPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PerfilEditarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context),
      endDrawer: getDrawer(context: context),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(Icons.arrow_back, size: 28),
                      Text("Cancelar", style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: widget.usuario!.username,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getBottomBar(context: context),
    );
  }
}
