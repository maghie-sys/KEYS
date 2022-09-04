import 'package:flutter/material.dart';

class CommonTermsStyle {
  //각 조 폰트 스타일
  Widget title(String title, {double size = 18}) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.black,
      ),
    );
  }

  Widget description(String value, {double tabIn = 1}) {
    //본문 폰트 스타일
    return Padding(
      padding: EdgeInsets.only(left: tabIn * 15.0),
      child: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}