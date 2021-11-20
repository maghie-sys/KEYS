import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyinfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/choon.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Hyundai_Choonsik',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              width: 500,
              child: Divider(
                color: Colors.black26,
                thickness: 5.0,
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text('내정보 수정'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text('뱃지현황'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text('최근결제내역'),
                ),
              ],
            ),
          ),
          Container(
            width: 500,
            child: Divider(
              color: Colors.black26,
              thickness: 5.0,
            ),
          ),
        ],
      ),
    ));
  }
}
