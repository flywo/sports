import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Home/Top/Top.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeTop((index) {
              print("切换TOP分类:$index");
            }, () {
              print("点击了搜索图标");
            }, currentIndex: 0,)
          ],
        ),
      ),
    );
  }
}
