import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class GetStartedDetails extends StatelessWidget {
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
              width: w*.3,
              padding: EdgeInsets.only(right: 20),
              child: Image.asset("assets/logo1.png")),
        ),
        SizedBox(height: orientation == Orientation.portrait ? h*.2 : h*.04,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w*.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text("Get Started!", style: TextStyle(fontSize: w*.08, color: Util.baseColor, fontFamily: 'Montserrat-Bold'),)),
              SizedBox(height: h*.09,),
              Text("Login / Register", style: TextStyle(fontFamily: 'Montserrat-Bold',fontSize: w*.03),),
              SizedBox(height: 20,),
              Text.rich(
                TextSpan(text: 'Whether you are a ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: 'Car owner ', style: TextStyle(color: Util.baseColor),),
                      TextSpan(text: ' or a '),
                      TextSpan(text: 'rental client', style: TextStyle(color: Util.baseColor),),
                      TextSpan(text: ", register locally to Shift or using your's facebook or Google account."),
                    ]
                ),
                style: TextStyle(fontFamily: 'Montserrat-Bold', fontSize: w*.03),
              ),
              SizedBox(height: 20,),
              Text("Valid Email address, Mobile Number, Address is required",style: TextStyle(fontFamily: 'Montserrat-Bold', fontSize: w*.03,color: Colors.grey)),
              SizedBox(height: 20,),
              Text.rich(
                TextSpan(
                    text: 'New',
                    style: TextStyle(color: Colors.grey),
                    children:[
                      TextSpan(text: ' Unregistered user', style: TextStyle(color: Util.baseColor)),
                      TextSpan(text: "?, don't worry, you are able to search and find cars without resgistring , by presseing "),
                      TextSpan(text: 'here', style: TextStyle(color: Util.baseColor,decoration: TextDecoration.underline)),
                    ]
                ),
                style: TextStyle(fontFamily: 'Montserrat-Bold', fontSize: w*.03),
              )
            ],
          ),
        ),
      ],
    );
  }
}
