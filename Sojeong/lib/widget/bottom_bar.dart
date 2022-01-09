//바텀 바를 설정하는 부분. 우리는 필요없을듯.
//바텀 바의 색상, 글자, 사이즈 등을 설정
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Container(
            height: 50,
            child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.transparent,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.home,
                      size: 18,
                    ),
                    child: Text(
                      '홈',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.search,
                      size: 18,
                    ),
                    child: Text(
                      '내주변',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.save_alt,
                      size: 18,
                    ),
                    child: Text(
                      '커뮤니티',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.list,
                      size: 18,
                    ),
                    child: Text(
                      '임시',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.face,
                      size: 18,
                    ),
                    child: Text(
                      '내정보',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ])));
  }
}
