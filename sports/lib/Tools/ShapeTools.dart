import 'package:flutter/cupertino.dart';

RoundedRectangleBorder buildRadius({@required double radius}) {
  return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius)));
}