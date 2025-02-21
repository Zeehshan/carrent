import 'package:car_rental/screen/my_info/rating_reviews.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:car_rental/widget/notification_widget.dart';
import 'package:car_rental/widget/star_rating.dart';
import 'package:car_rental/widget/text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/country.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class MyInfoPage extends StatefulWidget {
  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {

  Country _selected;
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
            SizedBox(height: screen?h*.05:w*.04,),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Util.baseColor,size:screen ?w*.08:h*.08,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 5,),
                Text("My Information", style: TextStyle(fontSize:screen?w*.05:h*.05, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),
                Spacer(),
                NotificationBadgesWidget(
                  color: Util.baseColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: CustomTextFieldWidget(
                      labelText: 'First name',
                      hintText: 'first name here',
                    ),
                  ),
                  SizedBox(width: 20,),
                  Flexible(
                    child: CustomTextFieldWidget(
                      labelText: 'Last name',
                      hintText: 'last name here',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: CustomTextFieldWidget(
                labelText: 'E-mail address',
                hintText: 'email will here',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: CustomTextFieldWidget(
                labelText: 'Username',
                hintText: 'username will here',
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("${_selected?.name ?? "   Country"}",style: TextStyle(fontFamily: 'Montserrat-Bold',color: Colors.grey,height:.2),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CountryPicker(
                            showDialingCode: false,
                            onChanged: (Country country) {
                              setState(() {
                                _selected = country;
                              });
                            },
                            showFlag: false,
                            showName: false),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 1,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    width: w*.5,
                    child: CustomTextFieldWidget(
                      labelText: 'Phone number',
                      hintText: '+1 - ',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20,top: screen?h*.09:w*.09),
                  child: Text.rich(
                    TextSpan(
                      text: "Change Password",
                      recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                    ),
                    style: TextStyle(decoration: TextDecoration.underline, fontSize: screen?w*.03:h*.04,color: Util.baseColor,fontFamily: 'Montserrat-Black'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: CustomTextFieldWidget(
                labelText: 'Address',
                hintText: 'address will here',
              ),
            ),
            SizedBox(height: h*.05,),
            Text("Rating And Review", style: TextStyle(fontSize: screen?w*.03:h*.04, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: screen?4:2,),
                SmoothStarRating(
                  rating: 4.5,
                  allowHalfRating: false,
                  color: Colors.yellow,
                  size: screen?30:h*.09,
                  borderColor: Colors.grey,
                ),
                Spacer(),
                Text.rich(
                  TextSpan(
                    text: "More details",
                    recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(context, Util.createRoute(page: RatingAndReviews())),
                  ),
                  style: TextStyle(fontSize: screen?w*.03:h*.04, fontFamily: 'Montserrat-Black', color: Colors.grey, decoration: TextDecoration.underline),
                ),
                SizedBox(width: 10,),
              ],
            ),
            SizedBox(height: h*.09,),
            CommanButton(
              text: 'Next',
            ),
            SizedBox(height: screen?0.0:20,),
          ],
        ),
      ),
    );
  }
}
