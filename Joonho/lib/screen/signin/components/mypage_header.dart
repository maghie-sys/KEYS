import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/components/default_button.dart';
import 'package:flutter_application_1/screen/signin/signin_screen.dart';

class MyPageHeader extends StatelessWidget {
  static String routeName = "/mypage";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            SizedBox(
              width: 150,
              child: Text(
                "회원가입하고\n 다양한 혜택을 받아보세요!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "가입혜택 보기 >",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: DefaultButton(
                text: "로그인/회원가입",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                  // Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
