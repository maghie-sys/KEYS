import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_exit.dart';
import 'package:flutter_application_1/screen/detail_screen.dart';

//여기는 홈 페이지의 상단 포스터 화면 전환 및
//찜, 상세보기로 넘어가기 위한 페이지
//캐루셀 슬라이더를 만들기 위해서는 carousel_slider 패키지 설치가 필요
class CarouselImage extends StatefulWidget {
  final List<Exit> exit;
  CarouselImage({required this.exit});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Exit>? exit;
  List<Widget>? images;
  List<String>? keywords;
  List<bool>? likes;
  int _currentPage = 0; //이미지4가 어디에 있는지 index를 저장하기 위해 현재 페이지 변수 생성
  String? _currentKeyword; //그 페이지에 키워드 또한 저장하기 위해 변수로 설정

  @override
  void initState() {
    super.initState();
    exit = widget.exit;
    images = exit?.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = exit?.map((m) => m.keywords).toList();
    likes = exit?.map((m) => m.like).toList();
    _currentKeyword = keywords?[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords?[_currentPage];
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword!,
              style: TextStyle(fontSize: 11),
            ),
          ), //메인 이미지와 글자와의 간격 및 크기
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  likes![_currentPage]
                      ? IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {},
                        ) //찜을 했다면 체크 표시
                      : IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ), //찜을 하지 않았다면 플러스 표시
                  Text(
                    '찜하기',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              )),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text('요것은 버튼임'),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {
                        //해당 버튼을 누르면
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              return DetailScreen(
                                exit: exit![
                                    _currentPage], //해당 포스터가 인자로 넘어가서 디테일 스크린 화면이 보여지게됨.
                              );
                            }));
                      },
                    ),
                    Text(
                      '정보버튼',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes!, _currentPage),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currntPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currntPage == i
              ? Color.fromRGBO(0, 0, 0, 0.9)
              : Color.fromRGBO(0, 0, 0, 0.4),
        ),
      ),
    );
  }
  return results;
}
