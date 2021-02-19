import 'package:flutter/cupertino.dart';

import '../../Tools/ColorTools.dart';

class TopType extends StatefulWidget {
  List<String> types;
  int selectedIndex;
  final void Function(int) _selectedType;
  TopType(this.types, this._selectedType, this.selectedIndex);
  @override
  _TopTypeState createState() => _TopTypeState();
}

class _TopTypeState extends State<TopType> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          primary: true,
          itemCount: widget.types.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) =>
              _TopTypeItem(
                  widget.types[index],
                  widget.selectedIndex == index,
                  widget._selectedType
              )
      ),
    );
  }
}


class _TopTypeItem extends StatelessWidget {
  final _title;
  final _selected;
  final _selectedHandle;
  _TopTypeItem(this._title, this._selected, this._selectedHandle);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            /// 标题
            SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  _title,
                  style: TextStyle(
                    color: _selected ? Color27C5C3 : Color666666
                  ),
                ),
              ),
            ),
            /// 底部横线
            Opacity(
              opacity: _selected ? 1 : 0,
              child: Image.asset(
                "images/tab@2x.png",
                width: 25,
                height: 4,
              ),
            )
          ],
        ),
      ),
      onTap: _selectedHandle,
    );
  }
}

