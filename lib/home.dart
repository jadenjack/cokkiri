import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cokkiri/pages/tradePage.dart';
import 'package:cokkiri/pages/myPage.dart';

class CokkiriHome extends StatefulWidget {
  const CokkiriHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CokkiriHomeState();
}

class CokkiriHomeState extends State<CokkiriHome> {
  int currentIndex = 0;

  final List<Widget> pages = [
    CokkiriTradePage(),
    CokkiriMyPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange), label: '거래'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: '내 정보'),
        ],
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}

AppBar getAppBar() {
  return AppBar(
    titleSpacing: 0.0,
    elevation: 5.0,
    // backgroundColor: Color(0xff201F23),
    title: Text("Cokkiri"),
    leading: Image.asset("/images/logo.png"),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
    ],
  );
}
