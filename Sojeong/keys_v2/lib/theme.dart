import 'package:flutter/material.dart';
const keysPrimaryColor = Color(0xFF795548);
const keysTextColor = Color(0xFF795548);

ThemeData theme(){
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.brown),
      bodyText2: TextStyle(color:Colors.brown),
    ),
  ),
      primaryColor: keysPrimaryColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: keysPrimaryColor),
      bodyText2: TextStyle(color: keysPrimaryColor)
    )

  );
}