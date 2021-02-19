import 'package:flutter/cupertino.dart';
import 'package:sports/Home/CenterList/CenterListItem.dart';

class CenterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: true,
        itemCount: 20,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) => CenterListItem(CenterListModel(
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
        )
    );
  }
}
