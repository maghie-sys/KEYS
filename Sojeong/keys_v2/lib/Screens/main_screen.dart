import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/community_screen.dart';
import 'package:keys_v2/Screens/home_screen.dart';
import 'package:keys_v2/Screens/likes_screen.dart';
import 'package:keys_v2/Screens/location_screen.dart';
import 'package:keys_v2/Screens/Myinfo/myinfo_screen.dart';
import 'package:keys_v2/Screens/search/search_screen.dart';
import 'package:keys_v2/Screens/search/search_screen_demo.dart';
import 'package:keys_v2/Screens/signin/signin_screen.dart';
import 'package:keys_v2/botton_nav.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List pages = [
    HomeScreen(),
    //LocationScreen(),
    LikesScreen(),
    CommunityScreen(),
    SignInScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: pages[_selectedIndex],
      appBar: AppBar(
          title: Text(
            "KEYS",
            style: TextStyle(
                color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(icon: Icon(Icons.search_outlined),onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchList()));
            },color: Colors.brown,),
            TextButton(
                child: Text(
                  "내정보",
                  style: TextStyle(color: Colors.brown),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyinfoScreen()));
                })
          ]),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting, //버튼 누를때마다 하단 내비 배경색 바뀜
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown, //선택된 아이콘 색은 흰색
        unselectedItemColor: Colors.black12, //선택되지 않은 아이콘 색은 검은색
        selectedFontSize: 14.0,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: List.generate( // -->  하단 네비바 값을 bottom_nav.dart로 보내고 받아와서 출력
            bottomItems.length,
            (index) => BottomNavigationBarItem(
                  icon: Icon(bottomItems[index].icon),
                  label: bottomItems[index].label,
                  backgroundColor: bottomItems[index].color,
                )),
      ),
    );
  }
}
