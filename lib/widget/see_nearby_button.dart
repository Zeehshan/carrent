import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class SeeNearByButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      decoration: BoxDecoration(
        color: Util.baseColor,
      ),
      child: Row(
        children: <Widget>[
          Spacer(),
          Text("See near by cars", style: TextStyle(color: Colors.white, fontSize: screen?w*.04:h*.04,fontFamily: 'Montserrat-SemiBold'),),
          SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white,width: 1)
              ),
              child: Text("View",style: TextStyle(color: Colors.white, fontSize:screen?w*.04:h*.04, fontFamily: 'Montserrat-Bold'),),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
