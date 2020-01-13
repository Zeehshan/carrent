import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/star_rating.dart';
import 'package:flutter/material.dart';

class RatingAndReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: h*.04,),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Util.baseColor,size: w*.08,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 5,),
              Text("My Rating And Reviews", style: TextStyle(fontSize: w*.05, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),

            ],
          ),
          SizedBox(height: h*.06,),
          SmoothStarRating(
            rating: 4.5,
            allowHalfRating: false,
            color: Colors.yellow,
            size: 30,
            borderColor: Colors.grey,
          ),
          SizedBox(height: h*.06,),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(3, ((index){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text.rich(
                        TextSpan(
                          text: "UserName${index+1}",
                          children: [
                            TextSpan(
                              text: '(Rating',
                              style: TextStyle(fontSize: w*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),
                            ),
                            TextSpan(
                              text: "4.0)",
                              style: TextStyle(fontSize: w*.03, fontFamily: 'Montserrat-Bold', color: Colors.black),
                            ),
                          ],
                        ),
                        style: TextStyle(fontSize: w*.03, fontFamily: 'Montserrat-Bold', color: Util.baseColor),
                      ),
                      SizedBox(height: 10,),
                      Text("Username",style: TextStyle(fontSize: w*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),),
                      SizedBox(height: 30,),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              })),
            )
          ),
        ],
      ),
    );
  }
}
