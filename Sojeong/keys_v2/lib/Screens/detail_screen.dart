import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    var url =
        'https://gus8154.pythonanywhere.com/keys/api/theme/' + widget.Theme_id;
    //final response = await http.get(Uri.parse('https://gus8154.pythonanywhere.com/keys/api/th/1'));
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Theme_detail.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes))[0]);
      //return jsonDecode(Utf8Decoder(Theme_detail.fromJson(response.bodyBytes.toString())));
    } else {
      throw Exception('Failed to load album');
    }
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.brown,
          leading: IconButton(
            icon: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.brown,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Icon(
              Icons.search_outlined,
              color: Colors.brown,
            ),
            SizedBox(width: 25.0),
            SizedBox(width: 5.0),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
                bottom: 20.0, left: 0.0, top: 20.0, right: 0.0),
            child: FutureBuilder<Theme_detail>(
                future: futureTheme_detail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                new CircularProgressIndicator(),
                                imageUrl: "https://gus8154.pythonanywhere.com/" +
                                    snapshot.data.Th_Img1,
                                fit: BoxFit.cover,
                                width: 170.0,
                                height: 250.0,
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Row(children: [
                                    Text(snapshot.data.Th_Name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    //테마이름Text("머더파커 전주1호점, 010-5160-6542", style: TextStyle(fontSize: 16, color: Colors.black),),
                                  ]),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(children: [
                                    Text(
                                      "머더파커 전주1호점",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    )
                                  ]),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.people,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                          width: 5,
                                        ),
                                        Text(snapshot.data.Th_Nop,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                      ]),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.vpn_key,
                                          color: Colors.black,
                                        ),
                                        Text(snapshot.data.Th_Diff,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                      ]),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.schedule,
                                          color: Colors.black,
                                        ),
                                        Text(snapshot.data.Th_Time,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                      ]),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "가격은 추후 업데이트\n 예정입니다.",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ]),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 23, right: 23),
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            //Text("매장주소, 이름, 전화번호", style: TextStyle(fontSize: 16, color: Colors.black),),


                            const SizedBox(
                              height: 10,
                            ),


                            Text(
                              snapshot.data.Th_Intro,
                              style:
                              TextStyle(fontSize: 16, color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                                "______________________________________________",
                                style: TextStyle(color: Colors.black)),
                            Text(
                              "전북 전주시 완산구 전동 168-5",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black),
                            ),
                            Text(
                              "010-5160-6542",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                            //Text("______________리뷰영역__________________________", style: TextStyle(color: Colors.black)),

                            const SizedBox(
                              height: 3,
                            ),
                            //Text("광고영역"),
                          ]),
                        ),
                      ],
                    );


                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 6, vertical: 6),
                child: SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text('예약하기'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.brown))),
              ),
            ],
          ),),
    );
  }
}
