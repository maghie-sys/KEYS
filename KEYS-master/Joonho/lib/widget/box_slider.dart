import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_exit.dart';
import 'package:flutter_application_1/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Exit> exit; //model_exit 에서 불러오기 위함
  BoxSlider({required this.exit}); //리스트 형식으로 불러오기
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('요즘 핫한 카페'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, exit),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Exit> exit) {
  List<Widget> results = [];
  for (var i = 0; i < exit.length; i++) {
    results.add(
      InkWell(
        //클릭이 가능하도록
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  exit: exit[i], //해당 포스터가 인자로 넘어가서 디테일 스크린 화면이 보여지게됨.
                );
              }));
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('images/' + exit[i].poster),
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
