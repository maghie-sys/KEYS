import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/detail_screen.dart';
import 'package:keys_v2/home/poster.dart';
import 'package:http/http.dart' as http;

Future<List<Recommand>> fetchRecommand() async {
  final response = await http.get(Uri.parse('https://gus8154.pythonanywhere.com/keys/api/home/15/'));
  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    var recommandList = list.map((element) => Recommand.fromJson(element)).toList();
    return recommandList;
  } else { throw Exception('Failed to load album'); }
}

class Recommand {
  final int id;
  final String Th_Img1;

  Recommand({this.id, this.Th_Img1});

  factory Recommand.fromJson(Map<String, dynamic> json) {
    return Recommand(
      id: json['id'],
      Th_Img1: json['Th_Img1'],
    );
  }
}

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> posters = [
    //우선은 포스터 url값을 리스트로 만들어둠
    "assets/images/01.jpg",
    "assets/images/02.jpg",
    "assets/images/03.jpg",
    "assets/images/04.jpg",
    "assets/images/05.jpg",
    "assets/images/06.jpg",
  ];
  List<String> posters2 = [
    //우선은 포스터 url값을 리스트로 만들어둠
    "assets/images/07.jpg",
    "assets/images/08.jpg",
    "assets/images/09.jpg",
    "assets/images/10.jpg",
    "assets/images/11.jpg",
  ];
  List<String> posters3 = [
    //우선은 포스터 url값을 리스트로 만들어둠
    "assets/images/12.jpg",
    "assets/images/13.jpg",
    "assets/images/14.jpg",
    "assets/images/15.jpg",
    "assets/images/16.jpg",
  ];

  Future<List<Recommand>> futureRecommand;

  @override
  void initState() {
    super.initState();
    futureRecommand = fetchRecommand();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size appSize = MediaQuery.of(context).size;

    return SafeArea(
      child: CustomScrollView(
        scrollDirection: Axis.vertical, //전체 스크롤방향은 상하
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
            sliver: SliverToBoxAdapter(
                child: Container(
                    height: 200.0,
                    child: FutureBuilder<List<Recommand>>(
                        future: futureRecommand,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "혹시 여긴 어떨까요?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: Colors.brown),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        //itemCount: posters.length,
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          Recommand recommand = snapshot.data[index];
                                          if (index >= posters.length) {
                                            index = 0;
                                          }
                                          else {
                                            return GestureDetector(
                                              child: Padding(padding: const EdgeInsets.only(right: 10.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                  child: CachedNetworkImage(
                                                    placeholder: (context, url) => new CircularProgressIndicator(),
                                                    imageUrl: "https://gus8154.pythonanywhere.com/" + recommand.Th_Img1,
                                                    fit: BoxFit.cover,
                                                    width: 120.0,
                                                    height: 200.0,
                                                  ),
                                                ),
                                                //   ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(
                                                                Theme_id: recommand.id.toString() )));
                                              },
                                            );
                                          } }
                                    )

                                  /*child: ListView(
                              //포스터 출력부분. list view로 출력하며 좌우 스크롤
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                posters.length,
                                (index) => Poster(posterUrl: posters[index]),
                              ) //위에 리스트로 만든 poster url값을 poster.dart로 넘겨줌
                              )*/
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return CircularProgressIndicator();
                        }
                    )
                )
            ),
          ),
          /*
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "테마별",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: posters3.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Poster(
                            posterUrl: posters3[index],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        posterUrl: posters3[index])));
                          },
                        );
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "인기순위",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: posters2.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Poster(
                            posterUrl: posters2[index],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        posterUrl: posters2[index])));
                          },
                        );
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "신규테마",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: posters3.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Poster(
                            posterUrl: posters3[index],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        posterUrl: posters3[index])));
                          },
                        );
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 30.0,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "개인정보 처리 방침 영역_ home_screen.dart에 있어요",
                        style: TextStyle(color: Colors.brown),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 30.0,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "사업자 정보 영역_ home_screen.dart에 있어요",
                        style: TextStyle(color: Colors.brown),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          */


//        Text("개인정보 취급 방침 영역", style: TextStyle(color: Colors.brown),),
//        Text("사업자정보 영역", style: TextStyle(color: Colors.brown),),
        ],
      ),
    );
  }
}
