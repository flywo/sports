import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Model/HomeCenterListModel.dart';
import 'package:sports/Tools/ColorTools.dart';
import 'package:sports/Home/CenterList/CenterListItem.dart';
import 'package:sports/Tools/ShapeTools.dart';
import 'package:sports/Tools/TextTools.dart';

class CenterListFootballItem extends StatelessWidget {

  final CenterListModel _model;

  const CenterListFootballItem(this._model);

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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: buildText(title: "半${_model.half}", fontSize: 11, fontColor: Color999999),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: buildText(title: "角:${_model.corner}", fontSize: 11, fontColor: Color999999),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: buildVideo(_model.videos, space: 10.0),
                )
              ],
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              height: 1,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildText(title: _model.time, fontSize: 12, fontColor: Color333333, fontBold: true),
                        buildText(title: "${_model.name} 第${_model.current}轮", fontSize: 11, fontColor: Color999999)
                      ],
                    ),
                  ),
                  Expanded(child: _buildTeam()),
                  VerticalDivider(
                    width: 10,
                  ),
                  SizedBox(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildText(_model.leftP1, _model.leftP2, _model.leftP3),
                        _buildText(_model.midP1, _model.midP2, _model.midP3),
                        _buildText(_model.rightP1, _model.rightP2, _model.rightP3),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTeam() {
    Widget _buildSingleTeam(String name, String image, String point) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: buildText(title: name, fontSize: 12, fontColor: Color333333, textAlign: TextAlign.end, maxLines: 2)),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              image,
              height: 19,
              width: 19,
            ),
          ),
          SizedBox(
            width: 30,
            child: buildText(
                title: point,
                fontSize: 13,
                fontColor: Color555555,
                fontBold: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        _buildSingleTeam(_model.leftName, _model.leftIcon, _model.leftPoint),
        _buildSingleTeam(_model.rightName, _model.rightIcon, _model.rightPoint)
      ],
    );
  }

  Widget _buildText(t1, t2, t3) {
    return Row(
      children: [
        Expanded(child: buildText(title: t1, fontSize: 12, fontColor: Color333333)),
        Expanded(child: buildText(title: t2, fontSize: 12, fontColor: Color333333)),
        Expanded(child: buildText(title: t3, fontSize: 12, fontColor: Color333333)),
      ],
    );
  }
}
