import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/*
 "id": 1,
  "er": {
      "Er_Brand": "a",
      "Er_Name": "b",
      "Er_Num": "c",
      "ErAd_Add": "d",
      "Er_Homepage": "e"
  },
  "Th_Name": "테마이름1",
  "Th_Genre": "테마장르1",
  "Th_Nop": "테마인원수1",
  "Th_Time": "테마시간1",
  "Th_Diff": "테마난이도1",
  "Th_Fear": "테마공포도1",
  "Th_Act": "테마활동성1",
  "Th_Intro": "테마 소개글1",
  "Th_Img1": "/media/image/th/01.jpg"
*/

class Theme_detail {
  final int id;
  //final String Er_Brand;
  final String Th_Name;
  final String Th_Genre;
  final String Th_Nop;
  final String Th_Time;
  final String Th_Diff;
  final String Th_Fear;
  final String Th_Act;
  final String Th_Intro;
  final String Th_Img1;

  Theme_detail({
    this.id,
    //this.Er_Brand,
    this.Th_Name,
    this.Th_Genre,
    this.Th_Nop,
    this.Th_Time,
    this.Th_Diff,
    this.Th_Fear,
    this.Th_Act,
    this.Th_Intro,
    this.Th_Img1,
  });

  factory Theme_detail.fromJson(Map<String, dynamic> json) {
    return Theme_detail(
      id: json['id'],
      //Er_Brand: json['Er_Brand'],
      Th_Name: json['Th_Name'],
      Th_Genre: json['Th_Genre'],
      Th_Nop: json['Th_Nop'],
      Th_Time: json['Th_Time'],
      Th_Diff: json['Th_Diff'],
      Th_Fear: json['Th_Fear'],
      Th_Act: json['Th_Act'],
      Th_Intro: json['Th_Intro'],
      Th_Img1: json['Th_Img1'],
    );
  }
}

class DetailScreen extends StatefulWidget {
  static String routeName = "/detail";

  DetailScreen({Key key, this.Theme_id}) : super(key: key);
  final String Theme_id;

  //DetailScreen({this.Theme_id});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  Future<Theme_detail> fetchTheme_detail() async {
    var url = 'https://gus8154.pythonanywhere.com/keys/api/th/' + widget.Theme_id;
    //final response = await http.get(Uri.parse('https://gus8154.pythonanywhere.com/keys/api/th/1'));
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Theme_detail.fromJson(jsonDecode(response.body)[0]);
      //return jsonDecode(Utf8Decoder(Theme_detail.fromJson(response.bodyBytes.toString())));
    } else { throw Exception('Failed to load album'); }
  }

  Future<Theme_detail> futureTheme_detail;

  @override
  void initState() {
    super.initState();
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
                            children: [Text(snapshot.data.Th_Name),
                              const SizedBox(height: 6,),
                              Text(snapshot.data.Th_Nop),
                              const SizedBox(height: 6,),
                              Text(snapshot.data.Th_Diff),
                              const SizedBox(height: 6,),
                              Text(snapshot.data.Th_Time),
                              const SizedBox(height: 6,),]
                        ),
                      ],
                    ),
                    const SizedBox(height: 6,),
                    Text("adf"),
                    const SizedBox(height: 3,),
                    Text("가격 및 이벤트는 추후 업데이트 예정입니다.", style: TextStyle(color: Colors.grey),),
                    const SizedBox(height: 3,),
                    Text(snapshot.data.Th_Intro),
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
