//축하합니다. 진정한 search 페이지를 찾으셨습니다.

import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/detail_screen.dart';

class Theme {
  String id;
  String name;
  String poster;

  Theme({this.id, this.name, this.poster});
}

class SearchList extends StatefulWidget {
  static String routeName = "/search_list";
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = Text(
    "검색하기",
    style: TextStyle(color: Colors.brown),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.brown,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Theme> _list;
  List<Theme> _searchList = List();

  bool _IsSearching;
  String _searchText = "";
  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = List();
    _list.add(
      Theme(id:"1", name: "마법소녀", poster: "assets/images/01.jpg"),
    );
    _list.add(
      Theme(id:"2", name: "심판", poster: "assets/images/02.jpg"),
    );
    _list.add(
      Theme(id:"3",name: "커넥트", poster: "assets/images/03.jpg"),
    );
    _list.add(
      Theme(id:"4",name: "안녕하세요? 무엇을 도와드릴까요?", poster: "assets/images/04.jpg"),
    );
    _list.add(
      Theme(id:"5",name: "야근", poster: "assets/images/05.jpg"),
    );
    _searchList = _list;
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
        key: key,
        appBar: buildBar(context),
        body: GridView.builder(
            itemCount: _searchList.length,
            itemBuilder: (context, index) {
              return Uiitem(_searchList[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .65,
            )

          /* GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        childAspectRatio: 8.0 / 9.0,
        children: _IsSearching ? _buildSearchList() : _buildList(),
      ),*/
          //drawer: Navigationdrawer(),
        )
    );
  }

  List<Theme> _buildList() {
    return _list; //_list.map((contact) =>  Uiitem(contact)).toList();
  }

  List<Theme> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList =
          _list; //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
      /*for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }*/

      _searchList = _list
          .where((element) =>
      element.name.toLowerCase().contains(_searchText.toLowerCase()) ||
          element.poster.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Colors.brown),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.brown,
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                    decoration: InputDecoration(
                        hintText: "검색어를 입력하세요",
                        hintStyle: TextStyle(color: Colors.grey)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.brown,
      );
      this.appBarTitle = Text(
        "검색하기",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class Uiitem extends StatelessWidget {
  final Theme theme;
  Uiitem(this.theme);

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 7),
      elevation: 2.0,
      child: InkWell(
        splashColor: Colors.brown,
        onTap: () {
          //print(theme.id);
     /*     Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(
                          posterUrl: theme.poster)));*/
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          /*  AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(
                'assets/images/build.jpeg',
                fit: BoxFit.scaleDown,
              ),
            ),*/
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(theme.poster),
                    fit: BoxFit.cover,

                  ),
                  Text(
                    this.theme.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 0.0),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
