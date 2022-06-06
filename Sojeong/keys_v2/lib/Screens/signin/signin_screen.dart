import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/signin/keys_sign_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인", style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.brown,),
          ),
          onPressed: () =>Navigator.pop(context),
        ),
        bottom: PreferredSize(
          child: Divider(thickness: 0.5,height: 0.5, color:Colors.grey),
          preferredSize: Size.fromHeight(1.0),
          
        ),
        backgroundColor: Colors.white,
      ),
      body: KeysSignForm(),
    );
  }
}