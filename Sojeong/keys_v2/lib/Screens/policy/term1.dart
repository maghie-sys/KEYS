import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/policy/common_terms_style.dart';


class Terms1Widget extends StatelessWidget with CommonTermsStyle {
  const Terms1Widget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            '요기패스 이용약관',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        title('제1조 (약관의 목적)', size: 15),
        const SizedBox(height: 10),
        description(
            "본 약관의 목적은 요기패스를 이용하는 데 필요한 '주식회사 위대한 상상(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다."),
        const SizedBox(height: 10),
        description(
            "본 약관의 목적은 요기패스를 이용하는 데 필요한 '주식회사 위대한 상상(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
            tabIn: 2),
      ],
    );
  }
}