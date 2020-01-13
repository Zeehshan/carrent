import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bColor;
  final VoidCallback onPressed;
  MyButton({this.text, this.textColor,this.bColor, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        height: 50,
        decoration: BoxDecoration(
          color: bColor,
          border: Border.all(color: Colors.white.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: RawMaterialButton(
            onPressed: onPressed,
//                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            child: Center(child: Text(text??"", style: TextStyle(color: textColor),))));
  }
}
