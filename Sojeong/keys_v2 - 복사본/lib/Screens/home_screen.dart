import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keys_v2/home/poster.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  List<String> posters = [ //우선은 포스터 url값을 리스트로 만들어둠
    "assets/images/01.jpg",
    "assets/images/02.jpg",
    "assets/images/03.jpg",
    "assets/images/04.jpg",
    "assets/images/05.jpg",
    "assets/images/06.jpg",
  ];
  List<String> posters2 = [ //우선은 포스터 url값을 리스트로 만들어둠
    "assets/images/07.jpg",
    "assets/images/08.jpg",
    "assets/images/09.jpg",
    "assets/images/10.jpg",
    "assets/images/11.jpg",
  ];
  List<String> posters3 = [ //우선은 포스터 url값을 리스트로 만들어둠
    "assets/images/12.jpg",
    "assets/images/13.jpg",
    "assets/images/14.jpg",
    "assets/images/15.jpg",
    "assets/images/16.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size appSize = MediaQuery.of(context).size;


    return SafeArea(child:
    CustomScrollView(
      scrollDirection: Axis.vertical, //전체 스크롤방향은 상하
      slivers: [

        SliverPadding(padding: const EdgeInsets.only(bottom: 40.0, left:  10.0),
        sliver: SliverToBoxAdapter(
          child: Container(
            height: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text:"혹시 여긴 어떨까요?",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),
                  ),
                ),
                SizedBox(height: 10.0,),
                Expanded(child: ListView( //포스터 출력부분. list view로 출력하며 좌우 스크롤
                  scrollDirection: Axis.horizontal,
                  children: List.generate(posters.length, (index) => Poster(posterUrl: posters[index]),)//위에 리스트로 만든 poster url값을 poster.dart로 넘겨줌
                )),
              ],
            ),
            
          ),
        ),),
        SliverPadding(padding: const EdgeInsets.only(bottom: 40.0, left:  10.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:"테마별",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Expanded(child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(posters3.length, (index) => Poster(posterUrl: posters3[index]),)
                  )),
                ],
              ),

            ),
          ),),
        SliverPadding(padding: const EdgeInsets.only(bottom: 40.0, left:  10.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:"인기순위",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Expanded(child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(posters2.length, (index) => Poster(posterUrl: posters2[index]),)
                  )),
                ],
              ),

            ),
          ),),
        SliverPadding(padding: const EdgeInsets.only(bottom: 40.0, left:  10.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:"신규테마",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Expanded(child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(posters.length, (index) => Poster(posterUrl: posters[index]),)
                  )),
                ],
              ),

            ),
          ),),
        SliverPadding(padding: const EdgeInsets.only(bottom: 40.0, left:  10.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 30.0,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:"개인정보 처리 방침 영역_ home_screen.dart에 있어요",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ],
              ),
            ),
          ),),
        SliverPadding(padding: const EdgeInsets.only(bottom: 40.0, left:  10.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 30.0,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:"사업자 정보 영역_ home_screen.dart에 있어요",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ],
              ),
            ),
          ),),




//        Text("개인정보 취급 방침 영역", style: TextStyle(color: Colors.brown),),
//        Text("사업자정보 영역", style: TextStyle(color: Colors.brown),),
      ],
    ),);
  }
}
