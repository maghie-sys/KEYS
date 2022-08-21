import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyKeysHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.white,
      elevation: 0.5,
      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            const SizedBox(height: 30,),
            _buildProfileButton(),
            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton('뱃지1', FontAwesomeIcons.handshake),
                _buildRoundTextButton('뱃지2', FontAwesomeIcons.thermometerEmpty),
                _buildRoundTextButton('뱃지3', FontAwesomeIcons.heart),
              ],

            ),

            TextButton(

                child: Text(
                  "뱃지 더보기",
                  style: TextStyle(color: Colors.brown),
                  textAlign: TextAlign.right,
                ),
                onPressed: () {})
          ],
        ),
      ),

    );
  }
  Widget _buildProfileRow(){
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network('https://placeimg.com/200/100/people', fit: BoxFit.cover),
              ),
            ),


          ],
        ),
        SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('userName', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.brown),),
            SizedBox(height: 10),
            Text('UserIntroduction', style: TextStyle(color: Colors.blueGrey),)
          ],
        )
      ],
    );
  }
  Widget _buildProfileButton(){
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.brown,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        height: 45,
          child: Center(
            child: Text(
              '프로필 수정', style: TextStyle(color: Colors.brown),
            ),
          ),
      ),
    );
  }
  Widget _buildRoundTextButton(String title, IconData iconData){
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color.fromRGBO(255,226,208,1),
            border: Border.all(color: Color(0xFFD4D5DD), width: 0.5)),
      child: Icon(
      iconData,
        color: Colors.brown,
          ),
        ),
        SizedBox(height: 10,),
        Text(
          title,
          style: TextStyle(color: Colors.brown),

        )
      ],
    );
  }
}