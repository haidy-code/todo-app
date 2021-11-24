import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MythemeData {
  static const Color lightscaffoldbackground=Color.fromRGBO(223, 236, 219, 1);
  static final ThemeData lighttheme=ThemeData(
      primarySwatch: Colors.blue,//primary swatch hwa primary color bta3 altheme 3andy fe alapp klo
      scaffoldBackgroundColor:lightscaffoldbackground,
      textTheme: TextTheme(
  headline1: TextStyle(
  fontSize: 18,
    color: Colors.blue,
  ),
      headline2: TextStyle(
  fontSize: 16,
  color: Colors.black,
  ),
        headline3: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight:FontWeight.bold
        ),

        headline4: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
  )

  );
}