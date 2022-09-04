import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/policy/term1.dart';
import 'package:keys_v2/Screens/policy/term2.dart';

class PolicyMenu extends StatefulWidget {
  static String routeName = "/policy_menu";
  const PolicyMenu({key}) : super(key:key);

  @override
  State<StatefulWidget> createState() => _PolicyMenu();
 }

class _PolicyMenu extends State<PolicyMenu> {
  int index = 0;

  Widget _topMenu() {
    return Wrap(
      children: [
        _menuOne(
          menu: '이용약관',
          isActive: index == 0,
          onTap: () {
            index = 0;
            update();
          },
        ),
        _menuOne(
            menu: '개인정보 처리방침',
            isActive: index == 1,
            onTap: () {
              index = 1;
              update();
            }),
        _menuOne(
            menu: '개인정보 제3자 제공동의',
            isActive: index == 2,
            onTap: () {
              index = 2;
              update();
            }),
        _menuOne(
            menu: '위치기반 서비스 이용약관',
            isActive: index == 3,
            onTap: () {
              index = 3;
              update();
            }),
        _menuOne(
            menu: '요기패스 이용약관',
            isActive: index == 4,
            onTap: () {
              index = 4;
              update();
            }),
        _menuOne(
            menu: '전자금융거래 이용약관',
            isActive: index == 5,
            onTap: () {
              index = 5;
              update();
            }),
      ],
    );
  }

  void update() => setState(() {});

  Widget _menuOne(
      { String menu,
        bool isActive,
        Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 12,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color:
              isActive ? Colors.brown : const Color(0xffcccccc)),
          color: const Color(0xfffafafa),
        ),
        child: Center(
          child: Text(
            menu,
            style: TextStyle(
              color: isActive ? Colors.brown : Colors.black,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomContentView() {
    return IndexedStack(
      index: index,
      children: [
        const Terms1Widget(),
        const Terms2Widget(),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('서비스 약관'),
        leading: IconButton(
          icon: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.brown,),
          ),
          onPressed: () =>Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(10), child: _topMenu()),
            Padding(
                padding: const EdgeInsets.all(10), child: _bottomContentView()),
          ],
        ),
      ),
    );
  }
}