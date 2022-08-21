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
    /* return Card(


        elevation: 0.5,
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(iconMenuList.length, (index) => _buildRowIconItem(
                iconMenuList[index].title, iconMenuList[index].iconData),
            ),

          ),
        )
    );*/


    return ListTile(

      leading: Icon(Icons.inventory, color: Colors.brown,),
      title: Text("개인정보처리방침", style: TextStyle(color:Colors.brown, )),
      onTap: (){Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PolicyMenu()));},
    );
  }

  Widget _buildRowIconItem(String title, IconData iconData){
    return Container(
      height: 50,
      child: Row(
        children: [
          Icon(iconData, size: 20,color: Colors.brown,),
          const SizedBox(width: 20),
          Text(title, style: TextStyle(color:  Colors.brown, fontSize: 17),)
        ],
      ),
    );
  }
}