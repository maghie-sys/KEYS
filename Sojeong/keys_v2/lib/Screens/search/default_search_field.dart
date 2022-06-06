import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultSearchField extends StatefulWidget {

  _DefaultSearchFieldState createState() => _DefaultSearchFieldState();
}

class _DefaultSearchFieldState extends State<DefaultSearchField>{
  FocusNode _focusNode = FocusNode();
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _focusNode.addListener(() {
      _onFocusChange();
    });
  }

    void _onFocusChange(){
      setState(() {
        isFocus = !isFocus;
      });
    }
    void _unFocus(){
    _focusNode.unfocus();
    }

    @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Expanded(child: TextField(
          style: TextStyle(color: Colors.brown),
          focusNode: _focusNode,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[100],

            hintText: "검색어를 입력해 주세요.",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ),),
        Container(
          width: isFocus ? 50 : 0,
          child: isFocus
          ? Center(
            child: GestureDetector(
              onTap: _unFocus,
              child: Text(
                "취소",
                style: TextStyle(fontSize: 16,color: Colors.brown),
              ),
            ),
          )
              :SizedBox(),
        )
      ],
    );
    }
  }
