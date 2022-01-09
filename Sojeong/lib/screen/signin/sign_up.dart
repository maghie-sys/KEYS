import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/signin/components/keys_sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
      ),
      body: KeysSignUpForm(),
    );
  }
}
