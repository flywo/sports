import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Tools/ColorTools.dart';

/// 首页顶部
class HomeTop extends StatelessWidget {
  final void Function(int) _selectedIndex;
  final void Function() _selectedSearch;
  int _currentIndex;
  /// {}可选参数，设置值需要指明参数  []不需要指明参数，但位置不能变，不传参数则为nil  =设置默认值
  HomeTop(this._selectedIndex, this._selectedSearch, this._currentIndex);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.5, right: 12.5),
        child: Row(
          children: [
            /// 图片
            Image.asset(
              "images/横版直播logo@2x.png",
              width: 100.98,
              height: 24,
            ),
            /// 筛选项
            _HomeTopSegment(_currentIndex, (index) {
              if (_currentIndex == index) {
                return;
              }
              _selectedIndex(index);
            }),
            /// 搜索
            InkWell(
              child: Image.asset(
                "images/搜索@2x.png",
                width: 18,
                height: 18,
              ),
              onTap: _selectedSearch,
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
          ],
        ),
      ),
    );
  }
}


class _HomeTopSegment extends StatelessWidget {
  final _current;
  final _selectedIndex;
  _HomeTopSegment(this._current, this._selectedIndex);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 11, right: 11),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                width: 0.5,
                style: BorderStyle.solid,
                color: ColorD7D7D7
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TopType("热门", _current == 0, () {
              _selectedIndex(0);
            }, "热门选中@2x.png"),
            _TopType("足球", _current == 1, () {
              _selectedIndex(1);
            }, "足球未选@2x.png"),
            _TopType("篮球", _current == 2, () {
              _selectedIndex(2);
            }, "篮球未选@2x.png")
          ],
        ),
      ),
    );
  }
}


class _TopType extends StatelessWidget {
  final _title;
  final _show;
  final _tap;
  final _image;
  _TopType(this._title, this._show, this._tap, this._image);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Opacity(
              opacity: _show ? 1 : 0,
              child: Image.asset(
                "images/矩形@2x.png",
                height: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/" + _image,
                  width: 15,
                  height: 15,
                  color: _show ? ColorFFFFFF : Color999999,
                ),
                SizedBox(width: 3,),
                Text(
                  _title,
                  style: TextStyle(
                    color: _show ? ColorFFFFFF : Color999999,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        onTap: _tap
    );
  }
}
