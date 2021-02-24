import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Model/HomeCenterListModel.dart';
import 'package:sports/Tools/ColorTools.dart';
import 'package:sports/Tools/ShapeTools.dart';
import 'package:sports/Tools/TextTools.dart';

import 'CenterListItem.dart';

class CenterListBasketBallItem extends StatelessWidget {
  final CenterListModel _model;
  CenterListBasketBallItem(this._model);
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
                  child: buildText(title: _model.name, fontSize: 11, fontColor: Color999999),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: buildText(title: _model.currentStep, fontSize: 11, fontColor: Color999999),
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
                    child: Center(child: buildText(title: _model.time, fontSize: 12, fontColor: Color333333, fontBold: true)),
                  ),
                  Expanded(child: _buildTeam()),
                  VerticalDivider(
                    width: 10,
                  ),
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildText(_model.leftPTitle, _model.leftP1, _model.leftP2, _model.leftP3, _model.leftP4),
                        _buildText(_model.rightPTitle, _model.rightP1, _model.rightP2, _model.rightP3, _model.rightP4),
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
          SizedBox(width: 30, child: buildText(title: point, fontSize: 13, fontColor: Color555555, fontBold: true, textAlign: TextAlign.center, overflow: TextOverflow.visible),),
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

  Widget _buildText(text1, text2, text3, text4, text5) {
    return Row(
      children: [
        Expanded(child: buildText(title: text1, fontSize: 12, fontColor: Color333333)),
        Expanded(child: buildText(title: text2, fontSize: 12, fontColor: Color333333)),
        Expanded(child: buildText(title: text3, fontSize: 12, fontColor: Color333333)),
        Expanded(child: buildText(title: text4, fontSize: 12, fontColor: Color333333)),
        Expanded(child: buildText(title: text5, fontSize: 12, fontColor: Color333333)),
      ],
    );
  }
}
