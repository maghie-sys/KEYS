import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_exit_theme.dart';

class CircleSlider extends StatelessWidget {
  final List<ExitTheme> exittheme;
  CircleSlider({required this.exittheme});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
            ),
            Text('이런테마는 어떠세요?'),
            Container(
              height: 120,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: makeCircleImages(exittheme)),
            )
          ],
        ));
  }
}

List<Widget> makeCircleImages(List<ExitTheme> exittheme) {
  List<Widget> results = [];
  for (var i = 0; i < exittheme.length; i++) {
    results.add(
      InkWell(
        //클릭이 가능하도록
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/' + exittheme[i].themeposter),
              radius: 25,
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
