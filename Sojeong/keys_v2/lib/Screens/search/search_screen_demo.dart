//축하합니다. 진정한 search 페이지를 찾으셨습니다.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keys_v2/Screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class Search {
  final int id;
  final Er er;
  final String Th_Img1;

  Search({
    this.id,
    this.er,
    this.Th_Img1,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      id: json['id'],
      er: Er.fromJson(json['er']),
      Th_Img1: json['Th_Img1'],
    );
  }
}

class Er {
  final String Er_Brand;
  final String Er_Name;

  Er({this.Er_Brand, this.Er_Name});

  factory Er.fromJson(Map<String, dynamic> json) {
    return Er(
      Er_Brand: json['Er_Brand'],
      Er_Name: json['Er_Name'],
    );
  }
}

//------------------------------------------------------------------------------------
//streambuild를 통한 실시간 검색 쿼리 실행행
Stream<List<Search>> fetchSearchList(_searchText) async* {
  await Future.delayed(Duration(milliseconds: 500));
  var url = 'https://gus8154.pythonanywhere.com/keys/api/search/' + _searchText;
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List list = jsonDecode(utf8.decode(response.bodyBytes));
    //list==Utf8Decoder(list);
    var searchList = list.map((element) => Search.fromJson(element)).toList();
    yield searchList;
  } else {
    yield null;
  }
}

//앱 상태 선언
class SearchList extends StatefulWidget {
  static String routeName = "/search_list";

  SearchList({Key key, this.Theme_id}) : super(key: key);
  final String Theme_id;

  @override
  _SearchListState createState() => _SearchListState();
}

//실제 앱 실행
class _SearchListState extends State<SearchList> {
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  String _searchText = "";

  //검색 상태설정 state
  _SearchListState() {
    _searchQuery.addListener(() {
      setState(() {
        _searchText = _searchQuery.text;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    //futureSearchList=fetchSearchList(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: buildBar(context),
        body: StreamBuilder<List<Search>>(
            stream: fetchSearchList(_searchText),
            builder: (context, AsyncSnapshot<List<Search>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Search search = snapshot.data[index];
                      return Uiitem(search);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .65,
                    ));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return CircularProgressIndicator();
              return Text('검색하세요');
            }));
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.brown),
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: _searchQuery, // 검색창 controller
          decoration: InputDecoration(
              hintText: '검색어를 입력하세요',
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.brown,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.brown,
              )),
              filled: true,
              //prefixIcon: Icon(Icons.person_pin, color: Colors.red, size: 30),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.brown,
                  ),
                  onPressed: _searchQuery.clear)),
          style: TextStyle(fontSize: 18, color: Colors.black),
          //검색창에 입력 후 검색어를 전달하는 부분
          onFieldSubmitted: fetchSearchList,
        ));
  }
}

//그리드 뷰 함수
class Uiitem extends StatelessWidget {
  final Search search;

  Uiitem(this.search);

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 7),
      elevation: 2.0,
      child: InkWell(
        splashColor: Colors.brown,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(Theme_id: search.id.toString())));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CachedNetworkImage(
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                      imageUrl: "https://gus8154.pythonanywhere.com/" +
                          search.Th_Img1,
                      fit: BoxFit.cover,
                      width: 170.0,
                      height: 230.0,
                    ),
                    Text(
                      search.er.Er_Brand + "  " + search.er.Er_Name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 0.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
