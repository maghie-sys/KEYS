import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.white),
    textTheme: TextTheme(bodyText2: TextStyle(color:Colors.black),
    ),
  );
}