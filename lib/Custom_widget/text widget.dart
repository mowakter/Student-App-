
import 'package:flutter/material.dart';




class MyTextWidget extends StatelessWidget {
  MyTextWidget({
    super.key,required this.title,this.tSize, this.tColor,this.mLine
  });
  String title;
  double? tSize;
  Color? tColor;
  int? mLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: mLine ?? 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: tColor ?? Colors.green, fontSize: tSize ?? 20),
    );
  }
}