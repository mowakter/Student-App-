import 'package:flutter/material.dart';

import '../Custom_widget/text widget.dart';

class MyButton extends StatelessWidget {
   MyButton({super.key,required this.bName,this.bColor,required this.onTap});
  String bName;
  Color? bColor;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.blueAccent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              child: MyTextWidget(title: bName, tColor: Colors.white, tSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}


