import 'package:flutter/material.dart';

class CommonTermsStyle {
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