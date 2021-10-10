import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/model/model_exit.dart';
import 'dart:ui'; //블러효과를 주기 위해서 임포트

class DetailScreen extends StatefulWidget {
  final Exit exit; //방탈출 목록을 들고오기 위함
  DetailScreen({required this.exit});
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  @override
  void initState() {
    super.initState();
    like = widget.exit.like; //이 카페를 찜하고있는지 상태를 가져옴
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/' + widget.exit.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.asset(
                                      'images/' + widget.exit.poster),
                                  height: 300,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    '가나다라마사 아자차ㅏ타ㅏㅏ마',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    widget.exit.title, //포스터 제목을 가져옴
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.all(3),
                                    child: FlatButton(
                                      onPressed: () {},
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.play_arrow),
                                          Text('예약하기'),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0, //닫기버튼 구현
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
