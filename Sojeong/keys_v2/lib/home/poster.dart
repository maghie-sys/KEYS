
import 'package:flutter/cupertino.dart';

class Poster extends StatelessWidget{

  Poster({Key key, this.posterUrl}) : super(key: key);

  final String posterUrl;


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(right: 10.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Image(
        image: AssetImage(posterUrl),
        fit: BoxFit.cover,
        width: 120.0,
        height: 200.0,
      ),
    ),
    );
  }
}