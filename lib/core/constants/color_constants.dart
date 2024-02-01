import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;

  static ColorConstants get instance => _instance ??= ColorConstants._init();

  ColorConstants._init();

  Color get textColor => const Color.fromARGB(255, 0, 0, 0);
  Color get secondaryTextColor => const Color.fromARGB(142, 135, 134, 134);
  Color get shadowCardColor => const Color.fromARGB(107, 48, 133, 212);
  Color get floatingActionButtonColor => const Color.fromARGB(255, 246, 136, 1);
  Color get headerColor => const Color.fromARGB(172, 75, 75, 76);
  Color get white => const Color.fromARGB(255, 252, 252, 252);
  Color get green => Colors.green;
  Color get black => Colors.black;
}
