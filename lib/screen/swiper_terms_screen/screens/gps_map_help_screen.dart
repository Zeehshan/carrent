
import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class GpsMapHelpDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      children: <Widget>[
        SizedBox(height: orientation == Orientation.portrait ? h*.09 : h*.04,),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.only(right: 20),
              width: w*.3,
              child: Image.asset("assets/logo1.png")),
        ),
        SizedBox(height: orientation == Orientation.portrait ? h*.08 : h*.04,),
        Container(
            width: w*.7,
            child: Image.asset("assets/images/newgps.png")),
        SizedBox(height: orientation == Orientation.portrait ? h*.05 : h*.04,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w*.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("GPS Map",
                style: TextStyle(fontFamily: 'Montserrat-Bold', fontSize: w*.04),
              ),
              SizedBox(height: 14,),
              Text("Search for nearest car you wish to rent using our GPS map and view cars details and our best rated owners",
                style: TextStyle(fontFamily: 'Montserrat-Black', color: Colors.grey,fontSize: w*.03),
              ),
              SizedBox(height: 14,),
              Text("Car owners will list their cars for picup using the GPS map location for smooth reachability",
                style: TextStyle(fontFamily: 'Montserrat-Black', color: Colors.grey,fontSize: w*.03),
              )
            ],
          ),
        ),
      ],
    );
  }
}
