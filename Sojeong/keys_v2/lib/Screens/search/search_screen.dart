import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/search/keyword_search.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search_screen";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> searchKeyword = [
    "공포",
    "이스케이프룸",
    "스릴러",
    "드라마",
    "슬픔",
    "방탈출",
    "fear"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: KeywordSearch(searchKeyword));
            },
            icon: Icon(
              Icons.search,
              color: Colors.brown,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          '검색하기',
          style: TextStyle(color: Colors.brown),
        ),
      ),
      body: ListView.builder(
          itemCount: searchKeyword.length,
          itemBuilder: (context, position) => ListTile(
                title: Text(
                  searchKeyword[position],
                  style: TextStyle(color: Colors.brown),
                ),
              )),
    );
  }
}
