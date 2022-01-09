import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screen/community_screen.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/search_screen.dart';
import 'package:flutter_application_1/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

//탭 바 설정 부분. 바 아이콘 개수 설정 및
//탭 바 별로 화면 전환을 담당함.
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "KEYS",
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          //accentColor: Colors.white,
        ),
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: _buildKeysAppBar(),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomeScreen(),
                  SearchScreen(),
                  CommuityScreen(),
                  Container(
                    child: Center(
                      child: Text('4'),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Bottom(),
            )));
  }

  AppBar _buildKeysAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 1.0,
      //leading: new Icon(Icons.home),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "images/keys_logo.png",
        ),
      ),
      title: new Text("Keys", style: TextStyle(color: Color(0xff000000))),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.chat),
          //highlightColor: Colors.pink,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CommuityScreen())); //커뮤니티로 화면 이동
          },
        ),
        //SizedBox(width: 10),
        new IconButton(
          icon: new Icon(Icons.search),
          //highlightColor: Colors.pink,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CommuityScreen())); //검색화면으로 넘어가게 해야함.
          },
        ),
        //SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              image: AssetImage("images/choon.png"),
            ),
          ),
        )
      ],
    );
  }
}
