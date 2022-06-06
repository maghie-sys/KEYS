import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";

  DetailScreen({Key key, this.posterUrl}) : super(key: key);

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.brown,),
          ),
          onPressed: () =>Navigator.pop(context),
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    image: AssetImage(posterUrl),
                    fit: BoxFit.cover,
                    width: 170.0,
                    height: 250.0,
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

        ),
      ),
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
      )),
    );
  }
}
