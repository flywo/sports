import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:sports/Home/Bottom/Bottom.dart';
import 'package:sports/Home/CenterList/CenterList.dart';
import 'package:sports/Home/Top/Top.dart';
import 'package:sports/Model/HomeCenterListModel.dart';
import 'package:sports/Tools/ColorTools.dart';


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
                        current: "12",
                        time: "21:33",
                        name: "英超",
                        score: "1-2",
                        leftName: "阿森纳",
                        rightName: "切尔西",
                        leftIcon: "images/欧洲1@2x.png",
                        rightIcon: "images/欧洲2@2x.png",
                        leftPoint: "0.99",
                        rightPoint: "1.4",
                        leftVS: "1-1",
                        rightVS: "1-3",
                          half: "2",
                          corner: "4",
                          leftP1: "1.9",
                          leftP2: "1.5",
                          leftP3: "1.2",
                          leftP4: "1.1",
                          rightP1: "0.9",
                          rightP2: "0.8",
                          rightP3: "0.7",
                          rightP4: "0.6",
                          midP1: "1.0",
                          midP2: "1.1",
                          midP3: "0.9",
                          currentStep: "第二节",
                          leftPTitle: "峰",
                          rightPTitle: "封",
                        videos: []
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
                          current: "12",
                          time: "21:33",
                          name: "英超",
                          score: "1-2",
                          leftName: "阿森纳",
                          rightName: "切尔西",
                          leftIcon: "images/欧洲1@2x.png",
                          rightIcon: "images/欧洲2@2x.png",
                          leftPoint: "0.99",
                          rightPoint: "1.4",
                          leftVS: "1-1",
                          rightVS: "1-3",
                          half: "2",
                          corner: "4",
                          leftP1: "1.9",
                          leftP2: "1.5",
                          leftP3: "1.2",
                          leftP4: "1.1",
                          rightP1: "0.9",
                          rightP2: "0.8",
                          rightP3: "0.7",
                          rightP4: "0.6",
                          midP1: "1.0",
                          midP2: "1.1",
                          midP3: "0.9",
                          currentStep: "第二节",
                          leftPTitle: "峰",
                          rightPTitle: "封",
                          videos: []
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
          current: "12",
          time: "21:33",
          name: "英超",
          score: "1-2",
          leftName: "阿森纳",
          rightName: "切尔西",
          leftIcon: "images/欧洲1@2x.png",
          rightIcon: "images/欧洲2@2x.png",
          leftPoint: "999",
          rightPoint: "1.4",
          leftVS: "1-1",
          rightVS: "1-3",
          half: "2",
          corner: "4",
          leftP1: "1.9",
          leftP2: "1.5",
          leftP3: "1.2",
          leftP4: "1.1",
          rightP1: "0.9",
          rightP2: "0.8",
          rightP3: "0.7",
          rightP4: "0.6",
        midP1: "1.0",
        midP2: "1.1",
        midP3: "0.9",
          currentStep: "第二节",
          leftPTitle: "峰",
          rightPTitle: "封",
          videos: [
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", true),
          ],
      ),
      CenterListModel(
          current: "12",
          time: "21:33",
          name: "英超",
          score: "1-2",
          leftName: "阿森纳",
          rightName: "切尔西",
          leftIcon: "images/欧洲1@2x.png",
          rightIcon: "images/欧洲2@2x.png",
          leftPoint: "0.99",
          rightPoint: "1.4",
          leftVS: "1-1",
          rightVS: "1-3",
          half: "2",
          corner: "4",
          leftP1: "1.9",
          leftP2: "1.5",
          leftP3: "1.2",
          leftP4: "1.1",
          rightP1: "0.9",
          rightP2: "0.8",
          rightP3: "0.7",
          rightP4: "0.6",
          midP1: "1.0",
          midP2: "1.1",
          midP3: "0.9",
          currentStep: "第二节",
          leftPTitle: "峰",
          rightPTitle: "封",
          videos: [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
      CenterListModel(
          current: "12",
          time: "21:33",
          name: "英超",
          score: "1-2",
          leftName: "阿森纳",
          rightName: "切尔西",
          leftIcon: "images/欧洲1@2x.png",
          rightIcon: "images/欧洲2@2x.png",
          leftPoint: "0.99",
          rightPoint: "1.4",
          leftVS: "1-1",
          rightVS: "1-3",
          half: "2",
          corner: "4",
          leftP1: "1.9",
          leftP2: "1.5",
          leftP3: "1.2",
          leftP4: "1.1",
          rightP1: "0.9",
          rightP2: "0.8",
          rightP3: "0.7",
          rightP4: "0.6",
          midP1: "1.0",
          midP2: "1.1",
          midP3: "0.9",
          currentStep: "第二节",
          leftPTitle: "峰",
          rightPTitle: "封",
          videos: [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
      CenterListModel(
          current: "12",
          time: "21:33",
          name: "英超",
          score: "1-2",
          leftName: "阿森纳",
          rightName: "切尔西",
          leftIcon: "images/欧洲1@2x.png",
          rightIcon: "images/欧洲2@2x.png",
          leftPoint: "0.99",
          rightPoint: "1.4",
          leftVS: "1-1",
          rightVS: "1-3",
          half: "2",
          corner: "4",
          leftP1: "1.9",
          leftP2: "1.5",
          leftP3: "1.2",
          leftP4: "1.1",
          rightP1: "0.9",
          rightP2: "0.8",
          rightP3: "0.7",
          rightP4: "0.6",
          currentStep: "第二节",
          leftPTitle: "峰",
          rightPTitle: "封",
          midP1: "1.0",
          midP2: "1.1",
          midP3: "0.9",
          videos: [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", false),
          ]
      ),
    ],
    [
      CenterListModel(
          current: "12",
          time: "21:33",
          name: "英超",
          score: "1-2",
          leftName: "阿森纳",
          rightName: "切尔西",
          leftIcon: "images/欧洲1@2x.png",
          rightIcon: "images/欧洲2@2x.png",
          leftPoint: "0.99",
          rightPoint: "1.4",
          leftVS: "1-1",
          rightVS: "1-3",
          half: "2",
          corner: "4",
          leftP1: "1.9",
          leftP2: "1.5",
          leftP3: "1.2",
          leftP4: "1.1",
          rightP1: "0.9",
          rightP2: "0.8",
          rightP3: "0.7",
          rightP4: "0.6",
          midP1: "1.0",
          midP2: "1.1",
          midP3: "0.9",
          currentStep: "第二节",
          leftPTitle: "峰",
          rightPTitle: "封",
          videos: [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
    ],
    [
      CenterListModel(
          current: "12",
          time: "21:33",
          name: "英超",
          score: "1-2",
          leftName: "阿森纳",
          rightName: "切尔西",
          leftIcon: "images/欧洲1@2x.png",
          rightIcon: "images/欧洲2@2x.png",
          leftPoint: "0.99",
          rightPoint: "1.4",
          leftVS: "1-1",
          rightVS: "1-3",
          half: "2",
          corner: "4",
          leftP1: "1.9",
          leftP2: "1.5",
          leftP3: "1.2",
          leftP4: "1.1",
          rightP1: "0.9",
          rightP2: "0.8",
          rightP3: "0.7",
          rightP4: "0.6",
          midP1: "1.0",
          midP2: "1.1",
          midP3: "0.9",
          currentStep: "第二节",
          leftPTitle: "峰",
          rightPTitle: "封",
          videos: [
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
            Video("高清", "高清@2x.png", false),
            Video("高清", "高清@2x.png", true),
          ]
      ),
    ]
  ];
}
