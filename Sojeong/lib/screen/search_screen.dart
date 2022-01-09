import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter =
      TextEditingController(); //검색위젯을 컨트롤 할 수 있는 위젯 _filter를 만든다
  FocusNode focusNode = FocusNode(); //검색위젯에 커서가 있는지에 대한 상태를 가지고 있는 위젯
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      //_ filter위젯이 변화를 감지해서 _searchText상태를 ㅣ변화시키는 코드
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //Padding(padding: EdgeInsets.all(30)), //패딩 있다가 삭제 예정
          Container(
            color: Colors.white60,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    autofocus: true,
                    controller: _filter,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      suffixIcon: focusNode
                              .hasFocus //suffixIcon은 우측에 배치될 아이콘을 의미하고, 커서가 클릭되었다면,
                          ? IconButton(
                              //캔슬버튼 아이콘을 생성한다.
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                              onPressed: () {
                                //x버튼 눌렀을 때,
                                setState(() {
                                  _filter.clear(); //저장된 검색 데이터 삭제
                                  _searchText = ""; //입력한 텍스트 초기화(삭제)
                                });
                              },
                            )
                          : Container(), //그렇지 않다면 빈 컨테이너 생성
                      hintText: '검색',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          //테두리 투명 처리
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                focusNode.hasFocus
                    ? Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Text('취소'),
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                              focusNode.unfocus();
                            });
                          },
                        ),
                      )
                    : Expanded(
                        flex: 0,
                        child: Container(),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
