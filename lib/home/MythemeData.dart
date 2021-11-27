import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MythemeData {
  static const Color lightscaffoldbackground=Color.fromRGBO(223, 236, 219, 1);
  static const Color darkswatch=Color.fromRGBO(93, 156, 236, 1);
  static final ThemeData lighttheme=ThemeData(
      primarySwatch: Colors.blue,//primary swatch hwa primary color bta3 altheme 3andy fe alapp klo
      scaffoldBackgroundColor:lightscaffoldbackground,
      cardColor: Colors.white,
      canvasColor: Colors.black,
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

  ),
appBarTheme:AppBarTheme(

      titleTextStyle: TextStyle(color: Colors.white, fontSize: 30)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white ,
          selectedItemColor: darkswatch,
          )
  );
  static final ThemeData darktheme=ThemeData(
      primarySwatch:Colors.blue,//primary swatch hwa primary color bta3 altheme 3andy fe alapp klo
      scaffoldBackgroundColor:Color.fromRGBO(6, 14, 30, 1),
      cardColor:Color.fromRGBO(24, 25, 29, 1),
      canvasColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 18,
          color: Colors.blue,
        ),
        headline2: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        headline3: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight:FontWeight.bold
        ),

        headline4: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      appBarTheme:AppBarTheme(

          titleTextStyle: TextStyle(color: Color.fromRGBO(6, 14, 30, 1), fontSize: 30)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(20, 25, 34, 1) ,
          selectedItemColor: darkswatch,
          unselectedItemColor: Colors.white,
      elevation: 50)

  );
}