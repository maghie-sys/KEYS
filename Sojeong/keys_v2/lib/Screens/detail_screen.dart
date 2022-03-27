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
        actions: [
          Icon(Icons.search_outlined,color: Colors.brown,),
          SizedBox(width: 25.0),
          Padding(padding: const EdgeInsets.symmetric(vertical: 14.0),child: Text("내정보", style: TextStyle(color: Colors.brown),),),
          SizedBox(width: 15.0),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, top: 20.0, right: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
        child: Image(
          image: AssetImage(posterUrl),
          fit: BoxFit.cover,
          width: 170.0,
          height: 250.0,
        ),
        ),
    ),
    );
  }


}