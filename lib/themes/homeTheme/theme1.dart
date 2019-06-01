import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(58, 66, 86, 1.0);

const cardColor = Color.fromRGBO(64, 75, 96, 0.9);

/*creating Theme*/
ThemeData buildThemeData() {
  final baseTheme = ThemeData(
      fontFamily: "Raleway"
  );

  return baseTheme.copyWith(
    /*app bar color*/
      primaryColor: primaryColor,
      /*app body color*/
      scaffoldBackgroundColor: primaryColor,
      /*nav-drawer color*/
      canvasColor: primaryColor,
      cardColor: cardColor,
      textTheme: TextTheme().copyWith(
          button: TextStyle(
              color: Colors.white,
              fontSize: 18.0
          ),
          title: TextStyle(
              color: Colors.red
          )
      )

  );
}

