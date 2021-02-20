import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Home/Bottom/Bottom.dart';
import 'package:sports/Home/CenterList/CenterList.dart';
import 'package:sports/Home/Top/Top.dart';
import 'package:sports/Tools/ColorTools.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _types = ["所有", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _types.length,
      child: Scaffold(
        backgroundColor: ColorF9F9F9,
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: HomeTop((index) {
              print("切换TOP分类:$index");
            }, () {
              print("点击了搜索按钮");
            }, currentIndex: 0,),
          ),
          backgroundColor: ColorF9F9F9,
          bottom: _buildType()
        ),
        body: TabBarView(
          children: _types.map((e) => _buildContent()).toList(),
        ),
      ),
    );
  }

  Widget _buildType() {
    return TabBar(
      tabs: _types.map((e) => Tab(text: e,)).toList(),
      isScrollable: true,
      indicatorColor: Color27C5C3,
      labelColor: Color27C5C3,
      unselectedLabelColor: Color666666,
      labelStyle: TextStyle(
          color: Color27C5C3,
          fontSize: 14,
          fontWeight: FontWeight.bold
      ),
      unselectedLabelStyle: TextStyle(
          color: Color666666,
          fontSize: 14,
          fontWeight: FontWeight.normal
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Column(
        children: [
          /// 列表
          Expanded(
            child: CenterList(),
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
    );
  }
}
