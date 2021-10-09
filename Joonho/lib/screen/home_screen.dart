import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_exit.dart';
import 'package:flutter_application_1/model/model_exit_theme.dart';
import 'package:flutter_application_1/widget/box_slider.dart';
import 'package:flutter_application_1/widget/carousel_slider.dart';
import 'package:flutter_application_1/widget/circle_slider.dart';

//홈 화면 구성과 TOP 메뉴(아이콘 자리) 설정 부분
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Exit> exit = [
    Exit.fromMap({
      //인스턴스 생성, DB에서 가져오기 위해 실제로 가져오려고 아래와 같이 설정
      'title': '대탈출',
      'keyword': '#공포 #호러 #신비',
      'poster': 'exitout_image1.png',
      'like': false
    }),
    Exit.fromMap({
      'title': 'keyspace',
      'keyword': '#신비 #추리',
      'poster': 'exitout_image2.png',
      'like': false
    }),
    Exit.fromMap({
      'title': 'comaescape',
      'keyword': '#공포 #호러 #좀비',
      'poster': 'exitout_image3.png',
      'like': false
    }),
    Exit.fromMap({
      'title': '레드룸',
      'keyword': '#신비 #추리',
      'poster': 'exitout_image4.png',
      'like': false
    }),
  ];
  List<ExitTheme> exittheme = [
    //테마 불러오기
    ExitTheme.fromMap({'themetitle': '공포', 'themeposter': 'theme_horro.png'}),
    ExitTheme.fromMap(
        {'themetitle': '탐정', 'themeposter': 'theme_detector.png'}),
    ExitTheme.fromMap({'themetitle': '개그', 'themeposter': 'theme_smile.png'}),
    ExitTheme.fromMap(
        {'themetitle': '감동', 'themeposter': 'theme_impressive.png'}),
    ExitTheme.fromMap({'themetitle': '미로', 'themeposter': 'theme_miro.png'}),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CircleSlider(exittheme: exittheme),
        Stack(
          //적용한 순서대로 먼저 선언한 것 부터 깔림
          children: <Widget>[
            CarouselImage(exit: exit), //캐루셀 슬라이더가 먼저 깔리고,
            TopBar(), //그다음 top 바가 깔림
          ],
        ),
        BoxSlider(exit: exit),
      ],
    );
  }
}

//TOP바 설정 부분(아래)
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/keys_logo.png',
            fit: BoxFit.contain,
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '아이콘1자리',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '아이콘2자리',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
