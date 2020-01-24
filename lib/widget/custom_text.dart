import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String text1;
  final bool rating;
  final Color color;
  const CustomText({Key key, this.text, this.text1, this.rating = false, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Text.rich(
      TextSpan(
        text: text,
        children: [
          TextSpan(
            text: " (${rating?"Rating":""} ",
            style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),
          ),
          TextSpan(
            text: text1,
            style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.black),
          ),
          TextSpan(
            text: " )",
            style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),
          ),
        ],
      ),
      style: TextStyle(fontSize:screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: color?? Util.baseColor),
    );
  }
}
