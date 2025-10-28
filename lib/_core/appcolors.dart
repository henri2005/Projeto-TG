import 'dart:ui';
import 'package:flutter/material.dart';

abstract class AppColors {
  static final Color mainColor = Color(0xFF7F3E9B);
  static final Color backgroundColor = Color(0xFFDFDFDF);
  static final Color buttonColor = Color(0xFF5E1B7B);
  static final Color menuColor = Color(0xFFC1CFDA);
}

abstract class DarkColors {
  static final Color backgroundColor = Colors.black;
  static final Color mainColor = Color.fromARGB(255, 102, 102, 102);
  static final Color menuColor = Color.fromARGB(255, 76, 81, 85);
  static final Color buttonColor = Color.fromARGB(83, 83, 83, 100);
  static final Color containerColor = Color.fromARGB(217, 199, 199, 196);
}
