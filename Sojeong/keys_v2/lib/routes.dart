import 'package:flutter/cupertino.dart';
import 'package:keys_v2/Screens/detail_screen.dart';
import 'package:keys_v2/Screens/main_screen.dart';
import 'package:keys_v2/Screens/Myinfo/myinfo_screen.dart';
import 'package:keys_v2/Screens/search/search_screen.dart';
import 'package:keys_v2/Screens/search/search_screen_demo.dart';
import 'package:keys_v2/Screens/signin/signin_screen.dart';
import 'package:keys_v2/Screens/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  DetailScreen.routeName: (context) => DetailScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  //SearchScreen2.routeName: (context) => SearchScreen2(),
  SearchList.routeName: (context) => SearchList(),
  MyinfoScreen.routeName: (context) => MyinfoScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};