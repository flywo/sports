import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Text buildText({
  @required String title,
  @required double fontSize,
  @required Color fontColor,
  bool fontBold = false,
  TextAlign textAlign = TextAlign.start,
  TextOverflow overflow = TextOverflow.ellipsis,
  int maxLines = 1
}) {
  return Text(
    title ?? "",
    style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontBold ? FontWeight.bold : FontWeight.normal
    ),
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );
}