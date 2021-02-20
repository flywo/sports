import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports/Tools/ColorTools.dart';
import 'package:sports/Home/CenterList/CenterListItem.dart';

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
                  child: Text("半:0-0", style: TextStyle(color: Color999999, fontSize: 11)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("角:1-9", style: TextStyle(color: Color999999, fontSize: 11)),
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
                        Text("21:00", style: TextStyle(color: Color333333, fontSize: 12, fontWeight: FontWeight.bold)),
                        Text("英超 第18轮", style: TextStyle(color: Color999999, fontSize: 11)),
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
          Expanded(child: Text(name, style: TextStyle(color: Color333333, fontSize: 12,), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,)),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              image,
              height: 19,
              width: 19,
            ),
          ),
          SizedBox(width: 20, child: Text(point, style: TextStyle(color: Color555555, fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center,))
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
        Text("1.87", style: TextStyle(color: Color333333, fontSize: 12,)),
        Text("1.87", style: TextStyle(color: Color333333, fontSize: 12,)),
        Text("1.87", style: TextStyle(color: Color333333, fontSize: 12,)),
      ],
    );
  }
}
