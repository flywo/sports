import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Tools/ColorTools.dart';

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
    return SizedBox(
      height: 100,
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
          margin: EdgeInsets.only(left: 12.5, top: 5, right: 12.5, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${_model.time} ${_model.name} 第${_model.current}轮", style: TextStyle(color: Color333333, fontSize: 11),)
                ],
              ),
              Divider(
                indent: 15,
                endIndent: 15,
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_model.leftName, style: TextStyle(color: Color333333, fontSize: 12),),
                  SizedBox(width: 9,),
                  Image.asset(
                    _model.leftIcon,
                    height: 19,
                    width: 19,
                  ),
                  SizedBox(width: 15,),
                  Text("1-1", style: TextStyle(color: Color555555, fontSize: 19, fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  Image.asset(
                    _model.rightIcon,
                    height: 19,
                    width: 19,
                  ),
                  SizedBox(width: 9,),
                  Text(_model.rightName, style: TextStyle(color: Color333333, fontSize: 12),),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_model.leftPoint, style: TextStyle(color: Color27C5C3, fontSize: 11)),
                  SizedBox(width: 28,),
                  Text("半:${_model.leftVS}", style: TextStyle(color: Color999999, fontSize: 11)),
                  SizedBox(width: 10,),
                  Text("角:${_model.rightVS}", style: TextStyle(color: Color999999, fontSize: 11)),
                  SizedBox(width: 28,),
                  Text(_model.rightPoint, style: TextStyle(color: ColorDA4155, fontSize: 11)),
                ],
              ),
              SizedBox(height: 5,),
              _buildVideo(_model.videos),
            ],
          ),
        ),
        onTap: _selectedItem,
      ),
    );
  }

  Row _buildVideo(List<Video> list) {
    List<Widget> children = [];
    for (var value in list) {
      children.add(SizedBox(width: 20,));
      children.add(_VideoType(value.image, value.name, value.show));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children.isEmpty ?
      [Text("暂无更多信号", style: TextStyle(color: ColorC9C9C9, fontSize: 11))] :
      children,
    );
  }
}


class _VideoType extends StatelessWidget {
  final _imageName;
  final _name;
  final _show;
  _VideoType(this._imageName, this._name, this._show);
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
        Text(_name, style: TextStyle(color: _show ? Color666666 : ColorC9C9C9, fontSize: 11)),
      ],
    );
  }
}

