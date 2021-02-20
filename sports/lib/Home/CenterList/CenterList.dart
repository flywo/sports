import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:sports/Home/CenterList/CenterListItem.dart';
import 'package:sports/Tools/ColorTools.dart';

class CenterList extends StatelessWidget {

  final _list;
  final void Function() _refresh;
  final void Function() _load;
  final EasyRefreshController _controller;

  CenterList(this._list, this._refresh, this._load, this._controller);

  int _rowCountAtSection(int section) {
    return _list[section].length;
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
    return CenterListItem(
        _list[section][row],
        () {
          print("点击了item:$section $row");
        }
    );
  }

  double _sectionHeaderHeight(BuildContext context, int section) {
    return 41;
  }

  double _cellHeight(BuildContext context, int section, int row) {
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterTableView(
        sectionCount: _list.length,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
        listViewFatherWidgetBuilder: (BuildContext context, Widget listView) {
          return EasyRefresh(
            child: listView,
            enableControlFinishLoad: true,
            enableControlFinishRefresh: false,
            header: ClassicalHeader(),
            footer: ClassicalFooter(),
            controller: _controller,
            onRefresh: _refresh,
            onLoad: _load,
          );
        }
    );
  }
}
