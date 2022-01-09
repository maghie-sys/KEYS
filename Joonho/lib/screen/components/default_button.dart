import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? press;
  final Color color;

  const DefaultButton(
      {Key? key, this.text, this.press, this.color = Colors.black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(16),
        ),
        onPressed: press,
        child: Center(
          child: Text(
            text ?? "",
            style: TextTheme().subtitle1,
          ),
        ));
  }
}
