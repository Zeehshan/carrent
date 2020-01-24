import 'package:flutter/material.dart';

class NotificationBadgesWidget extends StatelessWidget {
  final Color color;
  NotificationBadgesWidget({this.color});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.message, size: screen?w*.08:h*.08,color: color??Colors.white,),
          ),
          Positioned(
            right: w*.0009,
            top: -h*.01,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Center(child: Text("2",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
            ),
          ),
        ],
      ),
    );
  }
}
