import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Theme_detail {
  final int id;
  final String Th_Img1;

  Theme_detail({this.id, this.Th_Img1});

  factory Theme_detail.fromJson(Map<String, dynamic> json) {
    return Theme_detail(
      id: json['id'],
      Th_Img1: json['Th_Img1'],
    );
  }
}

class DetailScreen extends StatelessWidget {

  static String routeName = "/detail";
  final String Theme_id;

  DetailScreen({Key key, this.Theme_id}) : super(key: key);

  Future<Theme_detail> fetchTheme_detail() async {
    //var url = 'https://gus8154.pythonanywhere.com/keys/api/th/' + Theme_id;
    final response = await http.get(Uri.parse('https://gus8154.pythonanywhere.com/keys/api/th/15'));
    //final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Theme_detail.fromJson(jsonDecode(response.body)[0]);
    } else { throw Exception('Failed to load album'); }
  }

  Future<Theme_detail> futureTheme_detail;
  @override
  void setState() {
    //super.initState();
    futureTheme_detail = fetchTheme_detail();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        actions: [
          Icon(
            Icons.search_outlined,
            color: Colors.brown,
          ),
          SizedBox(width: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              "내정보",
              style: TextStyle(color: Colors.brown),
            ),
          ),
          SizedBox(width: 15.0),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
            bottom: 20.0, left: 0.0, top: 20.0, right: 0.0),
        child: FutureBuilder<Theme_detail>(
          future: futureTheme_detail,
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => new CircularProgressIndicator(),
                      imageUrl: "https://gus8154.pythonanywhere.com/" + snapshot.data.Th_Img1,
                      fit: BoxFit.cover,
                      width: 120.0,
                      height: 200.0,
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("타이틀이름"),
                    const SizedBox(height: 6,),
                    Text("인원수"),
                    const SizedBox(height: 6,),
                    Text("난이도"),
                    const SizedBox(height: 6,),
                    Text("제한시간"),
                    const SizedBox(height: 6,),]
                  ),
                ],
                ),
              const SizedBox(height: 6,),
              Text("매장주소, 이름, 전화번호"),
              const SizedBox(height: 3,),
              Text("가격 및 이벤트는 추후 업데이트 예정입니다.", style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 3,),
              Text("소개글 영역~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"),
              const SizedBox(height: 3,),
              Text("리뷰영역________________________________________________________________________________________________________"),
              const SizedBox(height: 3,),
              Text("광고영역"),
            ],
            );
            bottomNavigationBar: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: SizedBox(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                          child: Text('예약하기'),
                          style: ElevatedButton.styleFrom(primary: Colors.brown))),
                  ),
                ],
              ),);
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
              return CircularProgressIndicator();
          }
    ),),);
  }
}
