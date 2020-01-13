import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class CommanButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final width;
  final Color color;
  final Widget child;
  const CommanButton({Key key, this.text, this.onPressed, this.width, this.color, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
//        padding: EdgeInsets.symmetric(vertical: 12,horizontal: w*.2),
      width: width ?? w*.4,
        height: screen ? h*.07 : w*.07,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: color != null ? [color.withOpacity(0.8),color] : [Util.baseColor.withOpacity(0.7), Util.baseColor]
            )
        ),
        child: InkWell(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(100),
            onTap: onPressed,
            child: Center(
                child: child ?? Text(text,style: TextStyle(color: Colors.white, fontSize:screen?w*.04:h*.04, fontFamily: 'Montserrat-Bold'),))),
      ),
    );
  }
}
