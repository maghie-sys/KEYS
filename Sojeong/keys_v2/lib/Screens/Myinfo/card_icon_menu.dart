import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keys_v2/Screens/Myinfo/icon_menu.dart';
import 'package:keys_v2/Screens/policy/policy_menu.dart';
import 'package:keys_v2/Screens/policy/privacy.dart';

class CardIconMenu extends StatelessWidget{
  final List<IconMenu> iconMenuList;
  CardIconMenu({this.iconMenuList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Column(
      children: [
      ListTile(
        leading: Icon(Icons.inventory, color: Colors.brown,),
        title: Text("개인정보처리방침", style: TextStyle(color:Colors.brown, )),
        onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PolicyMenu()));},
      ),
        ListTile(
          leading: Icon(Icons.inventory, color: Colors.white,),
          title: Text("개인정보처리방침", style: TextStyle(color:Colors.white, )),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.inventory, color: Colors.white,),
          title: Text("개인정보처리방침", style: TextStyle(color:Colors.white, )),
          onTap: (){},
        ),

        Center(
          child : Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/logo-min.png"),
              width: 25,
              height: 30,
            ),
            Text("2022 희애담, Co. All rights reserved.", style: TextStyle(color: Colors.black45),),
          ],
        ),
        ),
    ],);
  }

}