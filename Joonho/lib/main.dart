import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/commuity_screen.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
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
        title: "KEYS",
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          //accentColor: Colors.white,
        ),
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              /**appBar: AppBar(
                leading: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('images/keys_logo.png'),
                ),
                //title: Text('KEYS_RROJECT'),
              ),**/
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomeScreen(),
                  Container(
                    child: Center(
                      child: Text('2'),
                    ),
                  ),
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
}
