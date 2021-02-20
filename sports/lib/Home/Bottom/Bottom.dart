import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Tools/ColorTools.dart';

class Bottom extends StatefulWidget {
  final void Function(int) _selectedType;
  final void Function() _selectedRefresh;
  int current;
  Bottom(this.current, this._selectedType, this._selectedRefresh);
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 60,),
          /// 底部筛选
          Center(
            child: Container(
              width: 150,
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
                  _BottomType("比分", widget.current == 0, () {
                    if (widget.current == 0) {
                      return;
                    }
                    setState(() {
                      widget.current = 0;
                    });
                    widget._selectedType(0);
                  }, "比分选中@2x.png"),
                  _BottomType("指数", widget.current == 1, () {
                    if (widget.current == 1) {
                      return;
                    }
                    setState(() {
                      widget.current = 1;
                    });
                    widget._selectedType(1);
                  }, "比分选中@2x.png"),
                ],
              ),
            ),
          ),
          /// 底部右侧刷新
          InkWell(
            child: SizedBox(
              width: 60,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset("images/椭圆形@2x.png"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/刷新@2x.png",
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(height: 4,)
                    ],
                  )
                ],
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            onTap: widget._selectedRefresh,
          ),
        ],
      ),
    );
  }
}


class _BottomType extends StatelessWidget {
  final _title;
  final _show;
  final _tap;
  final _image;
  _BottomType(this._title, this._show, this._tap, this._image);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Opacity(
              opacity: _show ? 1 : 0,
              child: Image.asset(
                "images/矩形1@2x.png",
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
                  color: _show ? Color(0xff27c5c3) : Color(0xff999999),
                ),
                SizedBox(width: 3,),
                Text(
                  _title,
                  style: TextStyle(
                      color: _show ? Color(0xff27c5c3) : Color(0xff999999),
                      fontSize: 12,
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

