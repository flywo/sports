import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:sports/Home/Bottom/Bottom.dart';
import 'package:sports/Home/CenterList/CenterList.dart';
import 'package:sports/Home/Top/Top.dart';
import 'package:sports/Tools/ColorTools.dart';

import 'CenterList/CenterListItem.dart';

class Home extends StatefulWidget {
  int _topType = 0;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _types = ["所有", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲", "西甲"];
  var _contents = _buildModel();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _types.length,
      child: Scaffold(
        backgroundColor: ColorF9F9F9,
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: HomeTop((index) {
              setState(() {
                widget._topType = index;
              });
              print("切换TOP分类:$index");
            }, () {
              print("点击了搜索按钮");
            }, widget._topType,),
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
    final _controller = EasyRefreshController();
    return SafeArea(
      child: Column(
        children: [
          /// 列表
          Expanded(
            child: CenterList(
                widget._topType,
                _contents,
                ["2021-01-01 今天 星期二"],
                    () async {
                  await Future.delayed(Duration(seconds: 2), () {
                    print("刷新完毕");
                    setState(() {
                      _contents.add([CenterListModel(
                          "11",
                          "21:00",
                          "英超",
                          "阿",
                          "切尔西",
                          "images/欧洲1@2x.png",
                          "images/欧洲2@2x.png",
                          "0.686",
                          "1.4",
                          "1-1",
                          "1-5",
                          []
                      ),]);
                    });
                    _controller.resetLoadState();
                  });
                  print("刷新数据");
                    },
                    () async {
                  await Future.delayed(Duration(seconds: 2), () {
                    print("加载完毕");
                    setState(() {
                      _contents.add([CenterListModel(
                          "11",
                          "21:00",
                          "英超",
                          "阿森纳",
                          "切尔西",
                          "images/欧洲1@2x.png",
                          "images/欧洲2@2x.png",
                          "0.686",
                          "1.4",
                          "1-1",
                          "1-5",
                          []
                      ),]);
                    });
                    _controller.finishLoad(noMore: true);
                  });
                  print("加载数据");
                    },
                _controller
            ),
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

List _buildModel() {
  return [
    [
      CenterListModel(
          "11",
          "21:00",
          "英超",
          "阿森纳",
          "切",
          "images/欧洲1@2x.png",
          "images/欧洲2@2x.png",
          "0.686",
          "1.4",
          "1-1",
          "1-5",
          [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
      CenterListModel(
          "11",
          "21:00",
          "英超",
          "阿森纳",
          "切尔西",
          "images/欧洲1@2x.png",
          "images/欧洲2@2x.png",
          "0.686",
          "1.4",
          "1-1111",
          "1-5",
          []
      ),
      CenterListModel(
          "11",
          "21:00",
          "英超",
          "阿森纳",
          "切尔西",
          "images/欧洲1@2x.png",
          "images/欧洲2@2x.png",
          "0.686",
          "1.4",
          "1-1",
          "1-5",
          [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
      CenterListModel(
          "11",
          "21:00",
          "英超",
          "阿森纳",
          "切尔西",
          "images/欧洲1@2x.png",
          "images/欧洲2@2x.png",
          "0.686",
          "1.4",
          "1-1",
          "1-5",
          [
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", true),
          ]
      ),
    ],
    [
      CenterListModel(
          "11",
          "21:00",
          "英超",
          "阿森纳",
          "切尔西",
          "images/欧洲1@2x.png",
          "images/欧洲2@2x.png",
          "0.686",
          "1.4",
          "1-1",
          "1-5",
          [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
    ],
    [
      CenterListModel(
          "11",
          "21:00",
          "英超",
          "阿森纳",
          "切尔西",
          "images/欧洲1@2x.png",
          "images/欧洲2@2x.png",
          "0.686",
          "1.4",
          "1-1",
          "1-5",
          [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
    ]
  ];
}
