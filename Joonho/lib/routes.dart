import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/signin/components/mypage_header.dart';
import 'package:flutter_application_1/screen/signin/signin_screen.dart';
import 'screen/signin/signin_screen.dart';
import 'screen/signin/sign_up.dart';
import 'screen/signin/components/mypage_header.dart';

final Map<String, WidgetBuilder> route = {
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen()
};
