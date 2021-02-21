import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Tools/ColorTools.dart';
import 'package:sports/Home/CenterList/CenterListItem.dart';
import 'package:sports/Tools/TextTools.dart';

class CenterListFootballItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
        margin: EdgeInsets.only(left: 12.5, top: 5, right: 12.5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: buildText(title: "半:0-0", fontSize: 11, fontColor: Color999999),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: buildText(title: "角:1-9", fontSize: 11, fontColor: Color999999),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: VideoType("高清@2x.png", "高清", true),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: VideoType("高清@2x.png", "高清", true),
                ),
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
                        buildText(title: "21:00", fontSize: 12, fontColor: Color333333, fontBold: true),
                        buildText(title: "英超 第18轮", fontSize: 11, fontColor: Color999999)
                      ],
                    ),
                  ),
                  Expanded(child: _buildTeam()),
                  VerticalDivider(
                    width: 5,
                  ),
                  SizedBox(
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildText(),
                        _buildText(),
                        _buildText(),
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
          SizedBox(width: 20, child: buildText(title: point, fontSize: 13, fontColor: Color555555, fontBold: true, textAlign: TextAlign.center),),
        ],
      );
    }
    return Column(
      children: [
        _buildSingleTeam("队伍队伍队伍队伍队伍", "images/欧洲1@2x.png", "11"),
        _buildSingleTeam("队伍222222222222", "images/欧洲2@2x.png", "2")
      ],
    );
  }

  Widget _buildText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildText(title: "1.87", fontSize: 12, fontColor: Color333333),
        buildText(title: "1.87", fontSize: 12, fontColor: Color333333),
        buildText(title: "1.87", fontSize: 12, fontColor: Color333333),
      ],
    );
  }
}
