import 'package:car_rental/ruotes.dart';
import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc_pattern/lng_change_pattern.dart';


class LangSelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<String> _choices = <String>['English (US, UK)','Spanish','Arabic'];
    final bloc = Provider.of<LngChange>(context);
    String fntFamily = 'BukraAlt_Medium.otf';
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: orientation == Orientation.portrait ? h*.09 : h*.06, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: w*.3,
                  child: Image.asset("assets/logo1.png")),
              InkWell(
                  child: Text("Skip", style: TextStyle(color: Colors.grey, fontFamily: fntFamily),),
              onTap: (){
                    print("switchToMakeChoiceScreen");
                    NavigationRouter.switchToMakeChoiceScreen(context);
              },
              ),
            ],
          ),
        ),
        SizedBox(height: orientation == Orientation.portrait ? h*.3 : h*.2,),
        Text("Please Select Your Language", style: TextStyle(color: Util.baseColor, fontFamily: fntFamily,fontSize: 16),),
        SizedBox(height: 20,),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: w*.7,
            height: orientation == Orientation.portrait ? h*.3 : h*.4,
            decoration: BoxDecoration(
              color: Util.baseColor
            ),
            child:ListView(
              children: List.generate(3, ((index){
                return InkWell(
                  onTap: (){
                    bloc.changeIndex(index);
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: h*.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(_choices[index], style: TextStyle(color: Colors.white, fontFamily: fntFamily),),
                          SizedBox(width: 15,),
                          bloc.currentIndex == index ? Icon(Icons.check,color: Colors.white,size: w*.06,) : Container(),
                        ],
                      ),
                     SizedBox(height: h*.03,),
                     index == 2 ? Container() : Container(
                        height: 1,
                        width: w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              })),
            ),
          ),
        ),

      ],
    );
  }
}


//Column(
//children: <Widget>[
//Spacer(),
//Text("English (US, UK)", style: TextStyle(color: Colors.white, fontFamily: fntFamily),),
//Spacer(),
//Container(
//height: 1,
//width: w,
//color: Colors.white,
//),
//Spacer(),
//Text("Spanish", style: TextStyle(color: Colors.white, fontFamily: fntFamily),),
//Spacer(),
//Container(
//height: 1,
//width: w,
//color: Colors.white,
//),
//Spacer(),
//Text("Arabic", style: TextStyle(color: Colors.white, fontFamily: fntFamily),),
//Spacer(),
//],
//)