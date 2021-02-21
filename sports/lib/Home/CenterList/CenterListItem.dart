import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Tools/ColorTools.dart';
import 'package:sports/Tools/ShapeTools.dart';
import 'package:sports/Tools/TextTools.dart';

class CenterListModel {
  final current;
  final time;
  final name;
  final leftName;
  final rightName;
  final leftIcon;
  final rightIcon;
  final leftPoint;
  final rightPoint;
  final leftVS;
  final rightVS;
  final List<Video> videos;
  CenterListModel(
      this.current,
      this.time,
      this.name,
      this.leftName,
      this.rightName,
      this.leftIcon,
      this.rightIcon,
      this.leftPoint,
      this.rightPoint,
      this.leftVS,
      this.rightVS,
      this.videos
  );
}

class Video {
  final name;
  final image;
  final show;
  Video(this.name, this.image, this.show);
}

class CenterListItem extends StatelessWidget {
  final CenterListModel _model;
  final void Function() _selectedItem;
  CenterListItem(this._model, this._selectedItem);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: buildRadius(radius: 13),
        margin: EdgeInsets.only(left: 12.5, top: 5, right: 12.5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildText(title: "${_model.time} ${_model.name} 第${_model.current}轮", fontColor: Color333333, fontSize: 11)
              ],
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: buildText(title: _model.leftName, fontColor: Color333333, fontSize: 12, textAlign: TextAlign.end)),
                SizedBox(width: 9,),
                Image.asset(
                  _model.leftIcon,
                  height: 19,
                  width: 19,
                ),
                SizedBox(width: 15,),
                buildText(title: "1-1", fontSize: 19, fontColor: Color555555, fontBold: true),
                SizedBox(width: 15,),
                Image.asset(
                  _model.rightIcon,
                  height: 19,
                  width: 19,
                ),
                SizedBox(width: 9,),
                Expanded(child: buildText(title: _model.rightName, fontSize: 12, fontColor: Color333333)),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: buildText(title: _model.leftPoint, fontSize: 11, fontColor: Color27C5C3, textAlign: TextAlign.end)),
                Row(
                  children: [
                    SizedBox(width: 28,),
                    buildText(title: "半:${_model.leftVS}", fontSize: 11, fontColor: Color999999),
                    SizedBox(width: 10,),
                    buildText(title: "角:${_model.rightVS}", fontSize: 11, fontColor: Color999999),
                    SizedBox(width: 28,),
                  ],
                ),
                Expanded(child: buildText(title: _model.rightPoint, fontSize: 11, fontColor: ColorDA4155)),
              ],
            ),
            SizedBox(height: 5,),
            _buildVideo(_model.videos),
          ],
        ),
      ),
      onTap: _selectedItem,
    );
  }

  Row _buildVideo(List<Video> list) {
    List<Widget> children = [];
    for (var value in list) {
      children.add(SizedBox(width: 20,));
      children.add(VideoType(value.image, value.name, value.show));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children.isEmpty ?
      [buildText(title: "暂无更多信号", fontSize: 11, fontColor: ColorC9C9C9)] :
      children,
    );
  }
}


class VideoType extends StatelessWidget {
  final _imageName;
  final _name;
  final _show;
  VideoType(this._imageName, this._name, this._show);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/" + _imageName,
          height: 10.5,
          width: 10.5,
          color: _show ? null : ColorC9C9C9,
        ),
        SizedBox(width: 2,),
        buildText(title: _name, fontSize: 11, fontColor: _show ? Color666666 : ColorC9C9C9)
      ],
    );
  }
}

