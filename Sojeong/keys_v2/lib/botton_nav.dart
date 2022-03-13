import 'package:flutter/material.dart';

class BottomNav {
  final int id;
  final IconData icon;
  final String label;
  final Color color;

  BottomNav({this.label, this.id, this.icon, this.color});

}

List<BottomNav> bottomItems = [
  BottomNav(id: 0, label: "홈", icon: Icons.home,color: Colors.black),
  BottomNav(id: 1, label: "내주변", icon: Icons.location_on,color: Colors.green),
  BottomNav(id: 2, label: "찜", icon: Icons.favorite,color: Colors.redAccent),
  BottomNav(id: 3, label: "커뮤니티", icon: Icons.chat_bubble,color: Colors.lightBlueAccent),
  BottomNav(id: 4, label: "더보기", icon: Icons.more_horiz,color: Colors.purple),
];