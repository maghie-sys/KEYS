import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconMenu{
  final String title;
  final IconData iconData;

  IconMenu({this.title, this.iconData});

}

final List<IconMenu> iconMenu1 = [
  IconMenu(title: '최근 결제 내역', iconData: FontAwesomeIcons.shoppingBag),
  IconMenu(title: '쿠폰함', iconData: FontAwesomeIcons.receipt),
  IconMenu(title: '리뷰관리', iconData: FontAwesomeIcons.key),
  IconMenu(title: '개인정보처리방침', iconData: FontAwesomeIcons.file)
];