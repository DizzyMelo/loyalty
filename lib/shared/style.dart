import 'package:flutter/material.dart';

class Style {
  static Map<int, Color> colorCodes = {
    50: Color.fromRGBO(255, 204, 0, .1),
    100: Color.fromRGBO(255, 204, 0, .2),
    200: Color.fromRGBO(255, 204, 0, .3),
    300: Color.fromRGBO(255, 204, 0, .4),
    400: Color.fromRGBO(255, 204, 0, .5),
    500: Color.fromRGBO(255, 204, 0, .6),
    600: Color.fromRGBO(255, 204, 0, .7),
    700: Color.fromRGBO(255, 204, 0, .8),
    800: Color.fromRGBO(255, 204, 0, .9),
    900: Color.fromRGBO(255, 204, 0, 1),
  };

  static MaterialColor themeColor = MaterialColor(0xFFFFCC00, colorCodes);
  static Color secondaryColor = Color.fromRGBO(0, 51, 77, 1);

  static TextStyle largeText = TextStyle(color: Colors.grey[900], fontSize: 18);
  static TextStyle mediumText =
      TextStyle(color: Colors.grey[600], fontSize: 15);
  static TextStyle smallText = TextStyle(color: Colors.grey, fontSize: 13);
}
