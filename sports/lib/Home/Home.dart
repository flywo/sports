import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Home/Bottom/Bottom.dart';
import 'package:sports/Home/Top/Top.dart';
import 'package:sports/Home/TopType/TopType.dart';

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
            /// 顶部
            HomeTop((index) {
              print("切换TOP分类:$index");
            }, () {
              print("点击了搜索按钮");
            }, currentIndex: 0,),
            /// 顶部比赛分类
            TopType(
                ["1", "2"], (index) {}, 0
            ),
            /// 列表
            Expanded(
              child: Text("1111"),
            ),
            /// 底部
            Bottom(
                0,
                (index) {
                  print("点击了BOTTOM分类:$index");
                },
                () {
                  print("点击了刷新按钮");
                }
            ),
          ],
        ),
      ),
    );
  }
}
