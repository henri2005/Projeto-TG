import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:turisr/appturismo.dart';
import 'package:flutter/material.dart';
import 'package:turisr/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // para carregar as alterações assíncronas antes de abrir o app
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(AppTurismo());
}
