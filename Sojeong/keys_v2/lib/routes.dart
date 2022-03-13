import 'package:flutter/cupertino.dart';
import 'package:keys_v2/Screens/main_screen.dart';
import 'package:keys_v2/Screens/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreen.routeName: (context) => MainScreen(),
};