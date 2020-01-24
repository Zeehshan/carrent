import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/custom_text.dart';
import 'package:car_rental/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/widget/custom_expansion.dart' as custom;
class RefundCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      body: Container(
        height: h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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

            Flexible(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: screen?h*.02:w*.02),
                    child: custom.ExpansionTile(
                      headerBackgroundColor: Colors.transparent,
                      iconColor: Util.baseColor,
                      title: new CustomText(
                        text: "Refunds count",
                        text1: "3",
                        color: Util.ratingColor,
                      ),
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
                                CustomText(text:"UserName${index+1}",text1: "01/01/2020"),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: screen?w*.05:h*.05),
                                child: Text("Listed car details",style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),),
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

                  Padding(
                    padding: EdgeInsets.only(left: screen?h*.02:w*.02),
                    child: custom.ExpansionTile(
                      headerBackgroundColor: Colors.transparent,
                      iconColor: Util.baseColor,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new CustomText(
                            text: "Refunds count",
                            text1: "3",
                            color: Util.ratingColor,
                          ),
                          SizedBox(height: 10,),
                          Text("System auto cancelled due to not rsponse",style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),)
                        ],
                      ),
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
                                CustomText(text:"UserName${index+1} - Date",text1: "01/01/2020"),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: screen?w*.05:h*.05),
                                child: Text("Listed car details",style: TextStyle(fontSize: screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold', color: Colors.grey),),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
