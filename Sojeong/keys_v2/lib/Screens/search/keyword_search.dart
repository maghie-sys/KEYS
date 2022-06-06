//여기까지 찾아오셨군요. 그러나 여기도 버려진 모듈입니다.

import 'package:flutter/material.dart';

class KeywordSearch extends SearchDelegate {
  List<String> searchKeyword;
  String selectedResult;

  KeywordSearch(this.searchKeyword);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.close,
            color: Colors.brown,
          ))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.brown,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      child: Center(
          child: Text(
        selectedResult,
        style: TextStyle(color: Colors.brown),
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> suggestedsearchKeyword = [];
    query.isEmpty
        ? suggestedsearchKeyword = searchKeyword
        : suggestedsearchKeyword.addAll(searchKeyword.where(
            (element) => element.toLowerCase().contains(query.toLowerCase())));

    return ListView.builder(
      itemCount: suggestedsearchKeyword.length,
      itemBuilder: (context, position) => ListTile(
        title: Text(
          suggestedsearchKeyword[position],
          style: TextStyle(color: Colors.brown),
        ),
      ),
    );
  }
}
