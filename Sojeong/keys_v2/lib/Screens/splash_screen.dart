import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/main_screen.dart';

class SplashScreen extends StatelessWidget{
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, MainScreen.routeName); //스플래쉬 화면 2초 실행후 main_screen.dart 불러옴
    });
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo.png"),
          width: 200,
          height: 300,
        ),
      ),
    );
  }
}