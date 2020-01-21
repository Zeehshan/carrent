import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Util.baseColor,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.white,
            size: 40,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.person,
              color: Util.baseColor,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
