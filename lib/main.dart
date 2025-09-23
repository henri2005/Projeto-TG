import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:turisr/appturismo.dart';
import 'package:flutter/material.dart';
import 'package:turisr/controller/locaisrepository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // para carregar as alterações assíncronas antes de abrir o app
  await GetStorage.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaisRepository(),
      child: AppTurismo(),
    ),
  );
}
