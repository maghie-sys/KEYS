import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/Myinfo/card_icon_menu.dart';
import 'package:keys_v2/Screens/Myinfo/icon_menu.dart';
import 'package:keys_v2/Screens/Myinfo/my_keys_header.dart';

class MyinfoScreen extends StatelessWidget{
  static String routeName = "/myinfo_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown,),
        ),
        onPressed: () =>Navigator.pop(context),
      ),

      title: const Text('My Keys', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
        actions: [
          //IconButton(icon: const Icon(Icons.settings), color: Colors.brown, onPressed: (){}),
        ],
    bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0.5),
    child: Divider(thickness: 0.5,height: 0.5, color:Colors.grey),
        ),
      ),

      body: ListView(
        children: [
          MyKeysHeader(),
          const SizedBox(height: 8.0,),
          CardIconMenu(iconMenuList: iconMenu1),
          const SizedBox(height: 8.0,),
          //CardIconMenu(iconMenuList: iconMenu2),
          const SizedBox(height: 8.0,),
          //CardIconMenu(iconMenuList: iconMenu3),
        ],
      )
    );
  }
}