import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keys_v2/Screens/splash_screen.dart';
import 'package:keys_v2/routes.dart';
import 'package:keys_v2/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug 마크 제거
      theme: theme(), //지정 테마 사용 theme.dart 참고
      initialRoute: SplashScreen.routeName,  //어플 실행시 splash_screen.dart 먼저 실행
      routes: route,
    );
  }
}