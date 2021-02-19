import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:sports/Home/CenterList/CenterListItem.dart';
import 'package:sports/Tools/ColorTools.dart';

class CenterList extends StatefulWidget {
  @override
  _CenterListState createState() => _CenterListState();
}

class _CenterListState extends State<CenterList> {

  int sectionCount = 3;

  int _rowCountAtSection(int section) {
    if (section == 0) {
      return 5;
    } else if (section == 1) {
      return 10;
    } else {
      return 20;
    }
  }

  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return Stack(
      children: [
        Container(
          color: ColorF9F9F9,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 12.5, right: 12.5, top: 5, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorF0F0F0,
          ),
          child: Text("11111")
        ),
      ],
    );
  }

  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: CenterListItem(CenterListModel(
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
      )
      ),
    );
  }

  double _sectionHeaderHeight(BuildContext context, int section) {
    return 41;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterTableView(
        sectionCount: sectionCount,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
        listViewFatherWidgetBuilder: (BuildContext context, Widget listView) {
          return EasyRefresh(
            child: listView,
          );
        }
    );
  }
}
