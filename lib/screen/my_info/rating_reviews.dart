import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/custom_text.dart';
import 'package:car_rental/widget/notification_widget.dart';
import 'package:car_rental/widget/star_rating.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'refund_count_screen.dart';

class RatingAndReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: screen?h*.05:w*.05,),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Util.baseColor,size:screen?w*.08:h*.08,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 5,),
                Text("My Rating", style: TextStyle(fontSize: screen?w*.05:h*.05, fontFamily: 'framd.ttf', color: Util.baseColor,fontWeight: FontWeight.bold),),
                Spacer(),
                NotificationBadgesWidget(
                  color: Util.baseColor,
                ),
              ],
            ),
            SizedBox(height: screen?h*.04:w*.04,),
            Text("4.5",style: TextStyle(color: Util.ratingColor,fontSize: screen?w*.07:h*.07,fontFamily: '29LTbukrabold.ttf'),),
            SmoothStarRating(
              rating: 4.5,
              allowHalfRating: false,
              color: Util.ratingColor,
              size: screen?30:h*.09,
              borderColor: Colors.grey,
            ),
            SizedBox(height: screen?h*.06:w*.06,),
            Container(
              height: h*.4,
              child: ListView(
                shrinkWrap: true,
                children: List.generate(10, ((index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.only(left: screen?w*.05:h*.05),
                          child:
                          CustomText(text:"UserName${index+1}",text1: "4.0",rating: true),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.only(left: screen?w*.05:h*.05),
                          child: Text("Comment",style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                }
                )
                ),
              ),
            ),
            SizedBox(height:screen?h*.07:w*.07),
            CustomText(text:"Renters number of refunds",text1: "3"),
            SizedBox(height: screen?h*.02:w*.02,),
            CustomText(text:"Cancelled rents count",text1: "3"),
            SizedBox(height: screen?h*.02:w*.02,),
            Text.rich(
              TextSpan(
                text: "More details",
                recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(context, Util.createRoute(page: RefundCount())),
              ),
              style: TextStyle(fontSize: screen?w*.03:h*.04, fontFamily: 'Montserrat-Black', color: Colors.grey, decoration: TextDecoration.underline),
            ),
            SizedBox(height: screen?h*.02:w*.02,),
            Text("\"Ratig and reviews as a car owner\"",style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
