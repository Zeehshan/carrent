import 'dart:io';

import 'package:car_rental/screen/swiper_terms_screen/screens/my_info.dart';
import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  File _avatar;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;

    return Container(
      color: Util.baseColor,
      height: h,
      width: w*.8,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: h*.05,),
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: l/12,
                      height: l/12,
                      color: Colors.grey,
                      child: Center(
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(top: h*.06,left: w*.1),
                    child: InkWell(
                      child: Icon(Icons.edit, size: 24,),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12,),
              Padding(
                padding: EdgeInsets.only(bottom: h*.04),
                child: Text("Username", style: TextStyle(fontFamily: 'Montserrat-Bold',fontSize: w*.04),),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(top: h*.06,right: 14),
                  width: w*.2,
                  child: Image.asset('assets/logo1.png',fit: BoxFit.fill,)
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.3),
            margin: EdgeInsets.symmetric(vertical: 10),

          ),
      Text("Home", style: TextStyle(fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 20,),
      Text("How it works?", style: TextStyle(color: Util.baseColor,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 20,),
      Text("My profile", style: TextStyle(color: Util.baseColor,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
      SizedBox(height: 10,),
      InkWell(
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context, Util.createRoute(page: MyInfoPage()));
          },
          child: Text("My Information", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03))),
          SizedBox(height: 10,),
      Text("My Financial Setup", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("My Listed Cars", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("My Rented Cars", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("My Financial Transaction", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 20,),
          Text("Go To", style: TextStyle(color: Util.baseColor,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("Book a rent", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("List My Car", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 20,),
          Text("About us", style: TextStyle(color: Util.baseColor,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("Who we are", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("Terms of services", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("Our privacy plicy", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("Contact Us", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 20,),
          Text("Support", style: TextStyle(color: Util.baseColor,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
          SizedBox(height: 10,),
          Text("Get instance support", style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat-Medium',fontSize: w*.03)),
        ],
      ),
    );
  }
}
